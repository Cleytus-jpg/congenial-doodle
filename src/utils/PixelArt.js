/**
 * Utility to create pixel art sprites programmatically
 */
export class PixelArtGenerator {
    /**
     * Create a canvas-based sprite from pixel data
     */
    static createSprite(width, height, pixelSize, drawFn) {
        const canvas = document.createElement('canvas');
        canvas.width = width * pixelSize;
        canvas.height = height * pixelSize;
        const ctx = canvas.getContext('2d');
        
        drawFn(ctx, pixelSize);
        
        return canvas.toDataURL();
    }
    
    /**
     * Draw a pixel at grid position
     */
    static drawPixel(ctx, x, y, size, color) {
        ctx.fillStyle = color;
        ctx.fillRect(x * size, y * size, size, size);
    }
    
    /**
     * Create Archer Tower pixel art (brown tower with bow)
     */
    static createArcherTower(pixelSize = 4) {
        return this.createSprite(16, 16, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Base (stone)
            const stone = '#8b7355';
            const darkStone = '#6b5545';
            
            // Tower base
            for (let y = 10; y < 16; y++) {
                for (let x = 4; x < 12; x++) {
                    p(x, y, y % 2 === x % 2 ? stone : darkStone);
                }
            }
            
            // Tower body
            const wood = '#8b4513';
            const darkWood = '#654321';
            for (let y = 6; y < 10; y++) {
                for (let x = 5; x < 11; x++) {
                    p(x, y, wood);
                }
            }
            
            // Roof
            const roof = '#654321';
            p(7, 4, roof); p(8, 4, roof);
            p(6, 5, roof); p(7, 5, roof); p(8, 5, roof); p(9, 5, roof);
            
            // Archer (simple stick figure)
            p(7, 7, '#ffe0bd'); // head
            p(8, 7, '#ffe0bd');
            p(7, 8, '#4169e1'); // body
            p(8, 8, '#4169e1');
            
            // Bow
            p(6, 7, '#654321');
            p(6, 8, '#654321');
            p(5, 7, '#ffffff'); // string
        });
    }
    
    /**
     * Create Arc Tower pixel art (electric blue tower)
     */
    static createArcTower(pixelSize = 4) {
        return this.createSprite(16, 16, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Base
            const stone = '#4a4a5a';
            const darkStone = '#2a2a3a';
            
            for (let y = 10; y < 16; y++) {
                for (let x = 4; x < 12; x++) {
                    p(x, y, y % 2 === x % 2 ? stone : darkStone);
                }
            }
            
            // Tower body (metallic)
            const metal = '#6a7a8a';
            const darkMetal = '#4a5a6a';
            for (let y = 6; y < 10; y++) {
                for (let x = 5; x < 11; x++) {
                    p(x, y, y % 2 === 0 ? metal : darkMetal);
                }
            }
            
            // Lightning rod
            const rod = '#c0c0c0';
            p(7, 3, rod); p(8, 3, rod);
            p(7, 4, rod); p(8, 4, rod);
            p(7, 5, rod); p(8, 5, rod);
            
            // Electric orbs
            const electric = '#00ffff';
            const electricGlow = '#0088ff';
            p(6, 4, electricGlow);
            p(9, 4, electricGlow);
            p(7, 2, electric);
            p(8, 2, electric);
            
            // Lightning bolts (small)
            p(5, 5, electric);
            p(10, 5, electric);
        });
    }
    
    /**
     * Create Zombie enemy pixel art
     */
    static createZombie(pixelSize = 3) {
        return this.createSprite(16, 16, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Zombie green
            const skin = '#7cb342';
            const darkSkin = '#558b2f';
            const clothes = '#424242';
            
            // Head
            for (let y = 3; y < 7; y++) {
                for (let x = 6; x < 10; x++) {
                    p(x, y, skin);
                }
            }
            
            // Eyes (red)
            p(6, 4, '#ff0000');
            p(9, 4, '#ff0000');
            
            // Body
            for (let y = 7; y < 12; y++) {
                for (let x = 5; x < 11; x++) {
                    p(x, y, clothes);
                }
            }
            
            // Arms
            p(4, 8, darkSkin); p(4, 9, darkSkin);
            p(11, 8, darkSkin); p(11, 9, darkSkin);
            
            // Legs
            p(6, 12, clothes); p(6, 13, clothes); p(6, 14, darkSkin);
            p(9, 12, clothes); p(9, 13, clothes); p(9, 14, darkSkin);
        });
    }
    
    /**
     * Create Frankenstein enemy pixel art
     */
    static createFrankenstein(pixelSize = 3) {
        return this.createSprite(16, 16, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Green skin
            const skin = '#4caf50';
            const darkSkin = '#2e7d32';
            const clothes = '#1a1a1a';
            const bolt = '#c0c0c0';
            
            // Head (larger)
            for (let y = 2; y < 8; y++) {
                for (let x = 5; x < 11; x++) {
                    p(x, y, skin);
                }
            }
            
            // Bolts on neck
            p(4, 7, bolt);
            p(11, 7, bolt);
            
            // Stitches
            p(7, 3, '#000000');
            p(8, 3, '#000000');
            
            // Eyes
            p(6, 4, '#ffffff');
            p(9, 4, '#ffffff');
            p(6, 5, '#000000');
            p(9, 5, '#000000');
            
            // Body (larger, muscular)
            for (let y = 8; y < 13; y++) {
                for (let x = 4; x < 12; x++) {
                    p(x, y, clothes);
                }
            }
            
            // Arms (thick)
            p(3, 9, darkSkin); p(3, 10, darkSkin);
            p(12, 9, darkSkin); p(12, 10, darkSkin);
            
            // Legs
            p(6, 13, clothes); p(6, 14, darkSkin);
            p(9, 13, clothes); p(9, 14, darkSkin);
        });
    }
    
    /**
     * Create Fast Enemy pixel art
     */
    static createFastEnemy(pixelSize = 3) {
        return this.createSprite(16, 16, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Fast enemy (yellow/orange, smaller)
            const skin = '#ffeb3b';
            const clothes = '#ff9800';
            
            // Small head
            p(7, 4, skin); p(8, 4, skin);
            p(7, 5, skin); p(8, 5, skin);
            
            // Eyes
            p(7, 4, '#000000');
            p(8, 4, '#000000');
            
            // Body (thin)
            for (let y = 6; y < 11; y++) {
                for (let x = 6; x < 10; x++) {
                    p(x, y, clothes);
                }
            }
            
            // Speed lines
            p(4, 7, '#ffffff');
            p(3, 8, '#ffffff');
            p(11, 7, '#ffffff');
            p(12, 8, '#ffffff');
            
            // Legs (longer, running pose)
            p(6, 11, clothes); p(6, 12, skin);
            p(9, 11, clothes); p(9, 13, skin);
        });
    }
    
    /**
     * Create Arrow projectile pixel art
     */
    static createArrow(pixelSize = 2) {
        return this.createSprite(16, 8, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Arrow shaft
            const wood = '#8b4513';
            for (let x = 4; x < 14; x++) {
                p(x, 3, wood);
                p(x, 4, wood);
            }
            
            // Arrowhead
            p(14, 2, '#c0c0c0');
            p(15, 3, '#c0c0c0');
            p(15, 4, '#c0c0c0');
            p(14, 5, '#c0c0c0');
            
            // Fletching
            p(3, 2, '#ff0000');
            p(4, 2, '#ff0000');
            p(3, 5, '#ff0000');
            p(4, 5, '#ff0000');
        });
    }
    
    /**
     * Create Arc projectile pixel art (lightning ball)
     */
    static createArcProjectile(pixelSize = 2) {
        return this.createSprite(16, 16, pixelSize, (ctx, size) => {
            const p = (x, y, color) => this.drawPixel(ctx, x, y, size, color);
            
            // Electric ball
            const electric = '#00ffff';
            const electricBright = '#ffffff';
            const electricGlow = '#0088ff';
            
            // Outer glow
            p(6, 7, electricGlow); p(9, 7, electricGlow);
            p(6, 8, electricGlow); p(9, 8, electricGlow);
            p(7, 6, electricGlow); p(8, 6, electricGlow);
            p(7, 9, electricGlow); p(8, 9, electricGlow);
            
            // Inner ball
            p(7, 7, electric); p(8, 7, electric);
            p(7, 8, electric); p(8, 8, electric);
            
            // Bright center
            p(7, 7, electricBright);
            
            // Lightning sparks
            p(5, 7, electric);
            p(10, 8, electric);
            p(7, 5, electric);
            p(8, 10, electric);
        });
    }
}
