import { Entity } from '../core/Entity.js';

/**
 * Base Tower class - defensive structure that attacks enemies
 */
export class Tower extends Entity {
    constructor(x, y, type) {
        super(x, y);
        this.type = type;
        this.range = 150;
        this.damage = 10;
        this.fireRate = 1; // shots per second
        this.fireTimer = 0;
        this.target = null;
        this.cost = 100;
        this.sellValue = 50;
        this.level = 1;
        this.upgradeCost = 50;
        
        this.width = 64;
        this.height = 64;
    }
    
    update(dt, input) {
        super.update(dt, input);
        
        this.fireTimer += dt;
        
        // Find target
        if (!this.target || this.target.destroyed || this.distanceTo(this.target) > this.range) {
            this.findTarget();
        }
        
        // Aim at target
        if (this.target) {
            this.rotation = this.angleTo(this.target);
        }
        
        // Shoot at target
        if (this.target && this.fireTimer >= 1 / this.fireRate) {
            this.shoot();
            this.fireTimer = 0;
        }
    }
    
    findTarget() {
        this.target = null;
        if (!this.scene) return;
        
        const enemies = this.scene.findEntities(e => 
            e.constructor.name.includes('Enemy') && !e.destroyed
        );
        
        for (const enemy of enemies) {
            if (this.distanceTo(enemy) <= this.range) {
                this.target = enemy;
                break;
            }
        }
    }
    
    shoot() {
        // Override in subclasses
    }
    
    upgrade() {
        if (this.level < 3) {
            this.level++;
            this.damage *= 1.5;
            this.fireRate *= 1.2;
            this.range *= 1.1;
            this.upgradeCost = Math.floor(this.upgradeCost * 1.5);
            return true;
        }
        return false;
    }
    
    render(ctx) {
        super.render(ctx);
        
        // Draw range indicator if selected
        if (this.showRange) {
            ctx.save();
            ctx.strokeStyle = 'rgba(255, 255, 255, 0.3)';
            ctx.lineWidth = 2;
            ctx.beginPath();
            ctx.arc(this.x, this.y, this.range, 0, Math.PI * 2);
            ctx.stroke();
            ctx.restore();
        }
    }
}

/**
 * Arc Tower - fires chain lightning that bounces between enemies
 */
export class ArcTower extends Tower {
    constructor(x, y) {
        super(x, y, 'arc');
        this.range = 180;
        this.damage = 15;
        this.fireRate = 0.8;
        this.chainCount = 3;
        this.cost = 150;
        this.sellValue = 75;
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('tower_arc');
            if (this.sprite) {
                this.width = 64;
                this.height = 64;
            }
        }
    }
    
    shoot() {
        // Import will be handled dynamically
        import('./Projectile.js').then(({ ArcProjectile }) => {
            const projectile = new ArcProjectile(this.x, this.y, this.target, this.damage, this.chainCount);
            this.scene.addEntity(projectile, 5);
        });
    }
}

/**
 * Archer Tower - fires arrows at enemies
 */
export class ArcherTower extends Tower {
    constructor(x, y) {
        super(x, y, 'archer');
        this.range = 200;
        this.damage = 20;
        this.fireRate = 1.5;
        this.cost = 100;
        this.sellValue = 50;
    }
    
    onCreate() {
        // Assign sprite
        if (window.assetManager) {
            this.sprite = window.assetManager.getSprite('tower_archer');
            if (this.sprite) {
                this.width = 64;
                this.height = 64;
            }
        }
    }
    
    shoot() {
        // Import will be handled dynamically
        import('./Projectile.js').then(({ ArrowProjectile }) => {
            const projectile = new ArrowProjectile(this.x, this.y, this.target, this.damage);
            this.scene.addEntity(projectile, 5);
        });
    }
}
