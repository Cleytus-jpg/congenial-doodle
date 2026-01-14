import { Entity } from '../core/Entity.js';

/**
 * Button UI element
 */
export class Button extends Entity {
    constructor(x, y, width, height, text, onClick) {
        super(x, y);
        this.width = width;
        this.height = height;
        this.text = text;
        this.onClick = onClick;
        
        this.hovered = false;
        this.pressed = false;
        this.enabled = true;
        
        // Styling
        this.backgroundColor = '#4CAF50';
        this.hoverColor = '#45a049';
        this.disabledColor = '#666666';
        this.textColor = '#ffffff';
        this.fontSize = 20;
        this.fontFamily = 'Arial';
        this.borderRadius = 8;
    }
    
    update(dt, input) {
        super.update(dt, input);
        
        if (!this.enabled) {
            this.hovered = false;
            return;
        }
        
        // Check if mouse is over button
        this.hovered = this.containsPoint(input.mouseX, input.mouseY);
    }
    
    handleClick(event) {
        if (!this.enabled) return;
        
        if (this.containsPoint(event.x, event.y)) {
            if (this.onClick) {
                this.onClick();
            }
        }
    }
    
    render(ctx) {
        ctx.save();
        
        // Determine color
        let bgColor = this.backgroundColor;
        if (!this.enabled) {
            bgColor = this.disabledColor;
        } else if (this.hovered) {
            bgColor = this.hoverColor;
        }
        
        // Draw rounded rectangle
        ctx.fillStyle = bgColor;
        this.roundRect(
            ctx,
            this.x - this.width / 2,
            this.y - this.height / 2,
            this.width,
            this.height,
            this.borderRadius
        );
        ctx.fill();
        
        // Draw border
        ctx.strokeStyle = 'rgba(0, 0, 0, 0.3)';
        ctx.lineWidth = 2;
        this.roundRect(
            ctx,
            this.x - this.width / 2,
            this.y - this.height / 2,
            this.width,
            this.height,
            this.borderRadius
        );
        ctx.stroke();
        
        // Draw text
        ctx.fillStyle = this.textColor;
        ctx.font = `${this.fontSize}px ${this.fontFamily}`;
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        ctx.fillText(this.text, this.x, this.y);
        
        ctx.restore();
    }
    
    roundRect(ctx, x, y, width, height, radius) {
        ctx.beginPath();
        ctx.moveTo(x + radius, y);
        ctx.lineTo(x + width - radius, y);
        ctx.quadraticCurveTo(x + width, y, x + width, y + radius);
        ctx.lineTo(x + width, y + height - radius);
        ctx.quadraticCurveTo(x + width, y + height, x + width - radius, y + height);
        ctx.lineTo(x + radius, y + height);
        ctx.quadraticCurveTo(x, y + height, x, y + height - radius);
        ctx.lineTo(x, y + radius);
        ctx.quadraticCurveTo(x, y, x + radius, y);
        ctx.closePath();
    }
}

/**
 * Tower Buy Button - specialized button for purchasing towers
 */
export class TowerBuyButton extends Button {
    constructor(x, y, towerType, cost, createTower) {
        super(x, y, 80, 100, '', null);
        this.towerType = towerType;
        this.cost = cost;
        this.createTower = createTower;
        
        // Override onClick to handle tower placement
        this.onClick = () => {
            if (this.scene && this.scene.gameState) {
                if (this.scene.gameState.gold >= this.cost) {
                    this.scene.startTowerPlacement(this.towerType, this.cost, this.createTower);
                }
            }
        };
    }
    
    update(dt, input) {
        // Check if player can afford
        if (this.scene && this.scene.gameState) {
            this.enabled = this.scene.gameState.gold >= this.cost;
        }
        
        super.update(dt, input);
    }
    
    render(ctx) {
        super.render(ctx);
        
        // Draw tower icon (placeholder for now)
        ctx.save();
        ctx.fillStyle = '#ffffff';
        ctx.font = '16px Arial';
        ctx.textAlign = 'center';
        ctx.fillText(this.towerType, this.x, this.y - 15);
        ctx.fillText(`$${this.cost}`, this.x, this.y + 15);
        ctx.restore();
    }
}

/**
 * Text label UI element
 */
export class Label extends Entity {
    constructor(x, y, text, fontSize = 24, color = '#ffffff') {
        super(x, y);
        this.text = text;
        this.fontSize = fontSize;
        this.color = color;
        this.fontFamily = 'Arial';
        this.textAlign = 'left';
        this.textBaseline = 'top';
    }
    
    render(ctx) {
        ctx.save();
        ctx.fillStyle = this.color;
        ctx.font = `${this.fontSize}px ${this.fontFamily}`;
        ctx.textAlign = this.textAlign;
        ctx.textBaseline = this.textBaseline;
        ctx.fillText(this.text, this.x, this.y);
        ctx.restore();
    }
}

/**
 * Panel UI element - container for other UI elements
 */
export class Panel extends Entity {
    constructor(x, y, width, height, backgroundColor = 'rgba(0, 0, 0, 0.7)') {
        super(x, y);
        this.width = width;
        this.height = height;
        this.backgroundColor = backgroundColor;
        this.borderColor = 'rgba(255, 255, 255, 0.3)';
        this.borderWidth = 2;
    }
    
    render(ctx) {
        ctx.save();
        
        // Draw background
        ctx.fillStyle = this.backgroundColor;
        ctx.fillRect(
            this.x - this.width / 2,
            this.y - this.height / 2,
            this.width,
            this.height
        );
        
        // Draw border
        ctx.strokeStyle = this.borderColor;
        ctx.lineWidth = this.borderWidth;
        ctx.strokeRect(
            this.x - this.width / 2,
            this.y - this.height / 2,
            this.width,
            this.height
        );
        
        ctx.restore();
    }
}
