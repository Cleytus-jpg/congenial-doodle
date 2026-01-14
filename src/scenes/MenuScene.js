import { Scene } from '../core/Scene.js';
import { Button } from '../ui/Button.js';

/**
 * Main Menu Scene
 */
export class MenuScene extends Scene {
    constructor() {
        super('menu');
        this.backgroundImage = null;
    }
    
    onEnter() {
        this.entities = [];
        this.layers.clear();
        
        // Create title
        // Create Start button
        const startButton = new Button(
            640, 360, 200, 60,
            'Start Game',
            () => {
                if (this.engine) {
                    this.engine.changeScene('game');
                }
            }
        );
        startButton.backgroundColor = '#2ecc71';
        startButton.hoverColor = '#27ae60';
        
        this.addEntity(startButton, 10);
        
        // Create Instructions button
        const instructionsButton = new Button(
            640, 440, 200, 60,
            'Instructions',
            () => {
                alert('Tower Defense Game\n\n' +
                      '1. Place towers along the path\n' +
                      '2. Towers automatically attack enemies\n' +
                      '3. Defeat all waves to win!\n' +
                      '4. Don\'t let enemies reach the end!');
            }
        );
        instructionsButton.backgroundColor = '#3498db';
        instructionsButton.hoverColor = '#2980b9';
        
        this.addEntity(instructionsButton, 10);
    }
    
    render(ctx) {
        // Draw background
        ctx.fillStyle = '#1a1a2e';
        ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        
        // Draw pattern
        ctx.strokeStyle = 'rgba(255, 255, 255, 0.05)';
        ctx.lineWidth = 1;
        for (let i = 0; i < ctx.canvas.width; i += 40) {
            ctx.beginPath();
            ctx.moveTo(i, 0);
            ctx.lineTo(i, ctx.canvas.height);
            ctx.stroke();
        }
        for (let i = 0; i < ctx.canvas.height; i += 40) {
            ctx.beginPath();
            ctx.moveTo(0, i);
            ctx.lineTo(ctx.canvas.width, i);
            ctx.stroke();
        }
        
        // Draw title
        ctx.fillStyle = '#ffffff';
        ctx.font = 'bold 64px Arial';
        ctx.textAlign = 'center';
        ctx.fillText('Tower Defense', ctx.canvas.width / 2, 180);
        
        // Draw subtitle
        ctx.font = '24px Arial';
        ctx.fillStyle = '#aaaaaa';
        ctx.fillText('Defend your castle from the undead!', ctx.canvas.width / 2, 240);
        
        // Render entities (buttons)
        super.render(ctx);
        
        // Draw credits
        ctx.font = '16px Arial';
        ctx.fillStyle = '#666666';
        ctx.fillText('Converted from GameMaker to JavaScript Canvas API', ctx.canvas.width / 2, ctx.canvas.height - 30);
    }
}
