import { Entity } from '../core/Entity.js';

/**
 * Base Enemy class - follows a path and attacks the player base
 */
export class Enemy extends Entity {
    constructor(x, y, path) {
        super(x, y);
        this.path = path || [];
        this.pathIndex = 0;
        this.speed = 50;
        this.health = 100;
        this.maxHealth = 100;
        this.reward = 10;
        this.damage = 1; // Damage to player when reaching end
        
        this.width = 48;
        this.height = 48;
    }
    
    update(dt, input) {
        if (this.pathIndex >= this.path.length) {
            this.reachedEnd();
            return;
        }
        
        const target = this.path[this.pathIndex];
        const angle = this.angleTo(target);
        this.velocityX = Math.cos(angle) * this.speed;
        this.velocityY = Math.sin(angle) * this.speed;
        
        // Update rotation to face direction
        this.rotation = angle;
        
        super.update(dt, input);
        
        // Check if reached waypoint
        if (this.distanceTo(target) < 10) {
            this.pathIndex++;
        }
    }
    
    takeDamage(amount) {
        this.health -= amount;
        
        // Flash effect
        this.alpha = 0.5;
        setTimeout(() => {
            if (!this.destroyed) {
                this.alpha = 1;
            }
        }, 100);
        
        if (this.health <= 0) {
            this.die();
        }
    }
    
    die() {
        // Award gold to player
        if (this.scene && this.scene.gameState) {
            this.scene.gameState.gold += this.reward;
            this.scene.gameState.score += this.reward * 10;
        }
        this.destroy();
    }
    
    reachedEnd() {
        // Damage player
        if (this.scene && this.scene.gameState) {
            this.scene.gameState.lives -= this.damage;
            
            // Check game over
            if (this.scene.gameState.lives <= 0) {
                this.scene.gameOver(false);
            }
        }
        this.destroy();
    }
    
    render(ctx) {
        super.render(ctx);
        
        // Draw health bar
        const barWidth = this.width;
        const barHeight = 5;
        const barY = -this.height / 2 - 12;
        
        ctx.save();
        
        // Background
        ctx.fillStyle = 'rgba(0, 0, 0, 0.5)';
        ctx.fillRect(this.x - barWidth / 2 - 1, this.y + barY - 1, barWidth + 2, barHeight + 2);
        
        // Red background
        ctx.fillStyle = '#ff0000';
        ctx.fillRect(this.x - barWidth / 2, this.y + barY, barWidth, barHeight);
        
        // Green health
        ctx.fillStyle = '#00ff00';
        const healthWidth = (this.health / this.maxHealth) * barWidth;
        ctx.fillRect(this.x - barWidth / 2, this.y + barY, healthWidth, barHeight);
        
        ctx.restore();
    }
}

/**
 * Zombie Enemy - basic slow enemy
 */
export class ZombieEnemy extends Enemy {
    constructor(x, y, path) {
        super(x, y, path);
        this.speed = 40;
        this.health = 80;
        this.maxHealth = 80;
        this.reward = 10;
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('enemy_zombie');
            if (this.sprite) {
                this.width = 48;
                this.height = 48;
            }
        }
    }
}

/**
 * Frankenstein Enemy - tanky slow enemy
 */
export class FrankensteinEnemy extends Enemy {
    constructor(x, y, path) {
        super(x, y, path);
        this.speed = 30;
        this.health = 200;
        this.maxHealth = 200;
        this.reward = 25;
        this.damage = 2;
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('enemy_frankenstein');
            if (this.sprite) {
                this.width = 48;
                this.height = 48;
            }
        }
    }
}

/**
 * Fast Enemy - quick but weak
 */
export class FastEnemy extends Enemy {
    constructor(x, y, path) {
        super(x, y, path);
        this.speed = 80;
        this.health = 50;
        this.maxHealth = 50;
        this.reward = 15;
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('enemy_fast');
            if (this.sprite) {
                this.width = 48;
                this.height = 48;
            }
        }
    }
}
