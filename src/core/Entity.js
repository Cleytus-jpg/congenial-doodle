/**
 * Base Entity class - represents any game object
 * All game objects (towers, enemies, projectiles, etc.) extend this
 */
export class Entity {
    constructor(x = 0, y = 0) {
        this.x = x;
        this.y = y;
        this.width = 0;
        this.height = 0;
        this.rotation = 0;
        this.scaleX = 1;
        this.scaleY = 1;
        this.alpha = 1;
        
        this.velocityX = 0;
        this.velocityY = 0;
        
        this.active = true;
        this.visible = true;
        this.destroyed = false;
        
        this.sprite = null;
        this.scene = null;
        
        // Animation
        this.animationFrame = 0;
        this.animationSpeed = 0.1;
        this.animationTimer = 0;
    }
    
    /**
     * Called when entity is created
     */
    onCreate() {
        // Override in subclasses
    }
    
    /**
     * Update entity logic
     */
    update(dt, input) {
        // Update position based on velocity
        this.x += this.velocityX * dt;
        this.y += this.velocityY * dt;
        
        // Update animation
        if (this.sprite && this.sprite.totalFrames > 1) {
            this.animationTimer += dt;
            if (this.animationTimer >= this.animationSpeed) {
                this.animationFrame = (this.animationFrame + 1) % this.sprite.totalFrames;
                this.animationTimer = 0;
            }
        }
    }
    
    /**
     * Render entity
     */
    render(ctx) {
        if (!this.sprite || !this.sprite.loaded) return;
        
        ctx.save();
        ctx.translate(this.x, this.y);
        ctx.rotate(this.rotation);
        ctx.scale(this.scaleX, this.scaleY);
        ctx.globalAlpha = this.alpha;
        
        this.sprite.render(ctx, -this.width / 2, -this.height / 2, this.animationFrame);
        
        ctx.restore();
    }
    
    /**
     * Mark entity for removal
     */
    destroy() {
        this.destroyed = true;
    }
    
    /**
     * Cleanup resources
     */
    cleanup() {
        // Override in subclasses if needed
    }
    
    /**
     * Calculate distance to another entity
     */
    distanceTo(other) {
        const dx = this.x - other.x;
        const dy = this.y - other.y;
        return Math.sqrt(dx * dx + dy * dy);
    }
    
    /**
     * Calculate angle to another entity (in radians)
     */
    angleTo(other) {
        return Math.atan2(other.y - this.y, other.x - this.x);
    }
    
    /**
     * Check if point is inside entity bounds
     */
    containsPoint(px, py) {
        return px >= this.x - this.width / 2 &&
               px <= this.x + this.width / 2 &&
               py >= this.y - this.height / 2 &&
               py <= this.y + this.height / 2;
    }
    
    /**
     * Check collision with another entity
     */
    collidesWith(other) {
        return this.x - this.width / 2 < other.x + other.width / 2 &&
               this.x + this.width / 2 > other.x - other.width / 2 &&
               this.y - this.height / 2 < other.y + other.height / 2 &&
               this.y + this.height / 2 > other.y - other.height / 2;
    }
}
