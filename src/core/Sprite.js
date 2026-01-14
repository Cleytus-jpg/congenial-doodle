/**
 * Sprite class - handles image loading and rendering
 * Supports sprite sheets with multiple frames
 */
export class Sprite {
    constructor(imagePath, frameWidth = null, frameHeight = null) {
        this.image = new Image();
        this.image.src = imagePath;
        this.loaded = false;
        this.failed = false;
        
        this.image.onload = () => {
            this.loaded = true;
            this.width = frameWidth || this.image.width;
            this.height = frameHeight || this.image.height;
            this.framesX = Math.floor(this.image.width / this.width);
            this.framesY = Math.floor(this.image.height / this.height);
            this.totalFrames = this.framesX * this.framesY;
        };
        
        this.image.onerror = () => {
            console.error(`Failed to load sprite: ${imagePath}`);
            this.failed = true;
        };
        
        this.currentFrame = 0;
    }
    
    /**
     * Render a specific frame of the sprite
     */
    render(ctx, x, y, frame = 0) {
        if (!this.loaded || this.failed) {
            // Draw placeholder
            ctx.fillStyle = '#ff00ff';
            ctx.fillRect(x, y, this.width || 32, this.height || 32);
            return;
        }
        
        const frameX = (frame % this.framesX) * this.width;
        const frameY = Math.floor(frame / this.framesX) * this.height;
        
        ctx.drawImage(
            this.image,
            frameX, frameY, this.width, this.height,
            x, y, this.width, this.height
        );
    }
}

/**
 * AssetManager - centralized asset loading and management
 */
export class AssetManager {
    constructor() {
        this.sprites = new Map();
        this.sounds = new Map();
        this.fonts = new Map();
        this.loadQueue = [];
        this.loadedCount = 0;
    }
    
    /**
     * Load a sprite and add to manager
     */
    async loadSprite(name, path, frameWidth = null, frameHeight = null) {
        return new Promise((resolve, reject) => {
            const sprite = new Sprite(path, frameWidth, frameHeight);
            
            sprite.image.onload = () => {
                this.sprites.set(name, sprite);
                this.loadedCount++;
                resolve(sprite);
            };
            
            sprite.image.onerror = () => {
                console.warn(`Failed to load sprite "${name}" from ${path}`);
                // Still add it so game doesn't crash
                this.sprites.set(name, sprite);
                this.loadedCount++;
                reject(new Error(`Failed to load: ${path}`));
            };
        });
    }
    
    /**
     * Get a loaded sprite by name
     */
    getSprite(name) {
        return this.sprites.get(name);
    }
    
    /**
     * Load multiple sprites at once
     */
    async loadSprites(spriteList) {
        const promises = spriteList.map(({ name, path, frameWidth, frameHeight }) =>
            this.loadSprite(name, path, frameWidth, frameHeight)
        );
        
        return Promise.allSettled(promises);
    }
    
    /**
     * Create a simple colored rectangle sprite
     */
    createColorSprite(name, width, height, color) {
        const canvas = document.createElement('canvas');
        canvas.width = width;
        canvas.height = height;
        const ctx = canvas.getContext('2d');
        
        ctx.fillStyle = color;
        ctx.fillRect(0, 0, width, height);
        
        const sprite = new Sprite(canvas.toDataURL());
        this.sprites.set(name, sprite);
        return sprite;
    }
    
    /**
     * Get loading progress (0-1)
     */
    getProgress() {
        if (this.loadQueue.length === 0) return 1;
        return this.loadedCount / this.loadQueue.length;
    }
}
