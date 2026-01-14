import { Entity } from '../core/Entity.js';

/**
 * Base Projectile class
 */
export class Projectile extends Entity {
    constructor(x, y, target, damage) {
        super(x, y);
        this.target = target;
        this.damage = damage;
        this.speed = 300;
        this.width = 16;
        this.height = 16;
    }
    
    update(dt, input) {
        if (!this.target || this.target.destroyed) {
            this.destroy();
            return;
        }
        
        // Move towards target
        const angle = this.angleTo(this.target);
        this.velocityX = Math.cos(angle) * this.speed;
        this.velocityY = Math.sin(angle) * this.speed;
        
        // Update rotation to face direction
        this.rotation = angle;
        
        super.update(dt, input);
        
        // Check if hit target
        if (this.distanceTo(this.target) < 15) {
            this.onHit();
            this.destroy();
        }
        
        // Destroy if off screen
        if (this.x < -100 || this.x > 1380 || this.y < -100 || this.y > 820) {
            this.destroy();
        }
    }
    
    onHit() {
        if (this.target && !this.target.destroyed) {
            this.target.takeDamage(this.damage);
        }
    }
}

/**
 * Arrow Projectile - simple straight shot
 */
export class ArrowProjectile extends Projectile {
    constructor(x, y, target, damage) {
        super(x, y, target, damage);
        this.speed = 400;
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('projectile_arrow');
            if (this.sprite) {
                this.width = 32;
                this.height = 16;
            }
        }
    }
}

/**
 * Arc Projectile - chain lightning that bounces
 */
export class ArcProjectile extends Projectile {
    constructor(x, y, target, damage, chainCount = 3) {
        super(x, y, target, damage);
        this.speed = 500;
        this.chainCount = chainCount;
        this.chainedEnemies = [target];
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('projectile_arc');
            if (this.sprite) {
                this.width = 32;
                this.height = 32;
            }
        }
    }
    
    onHit() {
        super.onHit();
        
        // Chain to next enemy
        if (this.chainCount > 1 && this.scene) {
            this.chainToNextEnemy();
        }
    }
    
    chainToNextEnemy() {
        const enemies = this.scene.findEntities(e => 
            e.constructor.name.includes('Enemy') && 
            !e.destroyed &&
            !this.chainedEnemies.includes(e) &&
            this.distanceTo(e) < 150
        );
        
        if (enemies.length > 0) {
            // Find closest enemy
            let closest = enemies[0];
            let closestDist = this.distanceTo(closest);
            
            for (const enemy of enemies) {
                const dist = this.distanceTo(enemy);
                if (dist < closestDist) {
                    closest = enemy;
                    closestDist = dist;
                }
            }
            
            const chainProj = new ArcProjectile(
                this.x, this.y, closest, 
                this.damage * 0.7, 
                this.chainCount - 1
            );
            chainProj.chainedEnemies = [...this.chainedEnemies, closest];
            this.scene.addEntity(chainProj, 5);
        }
    }
    
    render(ctx) {
        // Draw lightning effect
        if (this.target && !this.target.destroyed) {
            ctx.save();
            ctx.strokeStyle = '#00ffff';
            ctx.lineWidth = 3;
            ctx.shadowColor = '#00ffff';
            ctx.shadowBlur = 10;
            ctx.beginPath();
            ctx.moveTo(this.x, this.y);
            ctx.lineTo(this.target.x, this.target.y);
            ctx.stroke();
            ctx.restore();
        }
        
        super.render(ctx);
    }
}
