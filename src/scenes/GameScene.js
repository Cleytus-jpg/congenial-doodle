import { Scene } from '../core/Scene.js';
import { Button, TowerBuyButton, Label, Panel } from '../ui/Button.js';
import { ZombieEnemy, FrankensteinEnemy, FastEnemy } from '../entities/Enemy.js';
import { ArcTower, ArcherTower } from '../entities/Tower.js';

/**
 * Main Game Scene - where gameplay happens
 */
export class GameScene extends Scene {
    constructor() {
        super('game');
        
        // Game state
        this.gameState = {
            gold: 500,
            lives: 20,
            wave: 0,
            score: 0,
            isEndless: true
        };
        
        // Path for enemies to follow
        this.path = [
            {x: 0, y: 360},
            {x: 300, y: 360},
            {x: 300, y: 200},
            {x: 600, y: 200},
            {x: 600, y: 500},
            {x: 900, y: 500},
            {x: 900, y: 300},
            {x: 1280, y: 300}
        ];
        
        // Tower placement
        this.placingTower = null;
        this.placingTowerCost = 0;
        this.placingTowerFactory = null;
        this.placementValid = false;
        
        // Wave management
        this.waveInProgress = false;
        this.waveTimer = 0;
        this.enemiesRemaining = 0;
        
        // UI
        this.selectedTower = null;
        this.paused = false;

        // Endless wave chaining
        this.autoWaveDelaySeconds = 2.5;
        this.nextWaveTimer = 0;
        this.lastEnemyCount = 0;
    }
    
    onEnter() {
        this.entities = [];
        this.layers.clear();
        
        this.setupUI();

        // Auto-start if endless mode
        if (this.gameState.isEndless) {
            this.waveButton.enabled = false;
            this.startWave();
        }
    }
    
    setupUI() {
        // HUD Panel
        const hudPanel = new Panel(100, 40, 200, 60, 'rgba(0, 0, 0, 0.7)');
        this.addEntity(hudPanel, 100);
        
        // Tower Buy Buttons
        const arcButton = new TowerBuyButton(
            80, 650, 'Arc Tower', 150,
            (x, y) => new ArcTower(x, y)
        );
        this.addEntity(arcButton, 100);
        
        const archerButton = new TowerBuyButton(
            180, 650, 'Archer', 100,
            (x, y) => new ArcherTower(x, y)
        );
        this.addEntity(archerButton, 100);
        
        // Start Wave Button
        const waveButton = new Button(
            640, 50, 150, 50,
            'Start Wave',
            () => this.startWave()
        );
        waveButton.backgroundColor = '#e74c3c';
        waveButton.hoverColor = '#c0392b';
        this.waveButton = waveButton;
        this.addEntity(waveButton, 100);
    }
    
    startWave() {
        if (this.waveInProgress) return;
        
        this.gameState.wave++;
        this.waveInProgress = true;
        this.waveButton.enabled = !this.gameState.isEndless;
        this.nextWaveTimer = 0;
        
        // Spawn enemies based on wave (scales infinitely)
        const waveSize = 5 + Math.floor(this.gameState.wave * 2.5);
        this.enemiesRemaining = waveSize;
        
        for (let i = 0; i < waveSize; i++) {
            setTimeout(() => {
                this.spawnEnemy();
            }, i * 1000);
        }
    }
    
    spawnEnemy() {
        let enemy;
        const rand = Math.random();
        
        if (this.gameState.wave >= 5 && rand < 0.3) {
            enemy = new FrankensteinEnemy(this.path[0].x, this.path[0].y, this.path);
        } else if (this.gameState.wave >= 3 && rand < 0.5) {
            enemy = new FastEnemy(this.path[0].x, this.path[0].y, this.path);
        } else {
            enemy = new ZombieEnemy(this.path[0].x, this.path[0].y, this.path);
        }
        
        // Apply wave scaling
        enemy.health *= (1 + this.gameState.wave * 0.1);
        enemy.maxHealth = enemy.health;
        enemy.speed *= (1 + this.gameState.wave * 0.05);
        
        this.addEntity(enemy, 3);
    }
    
    startTowerPlacement(towerType, cost, factory) {
        if (this.gameState.gold < cost) return;
        
        this.placingTower = factory(0, 0);
        this.placingTowerCost = cost;
        this.placingTowerFactory = factory;
        this.placingTower.alpha = 0.6;
        this.placingTower.showRange = true;
    }
    
    update(dt, input) {
        if (this.paused) return;
        
        // Tower placement
        if (this.placingTower) {
            this.placingTower.x = input.mouseX;
            this.placingTower.y = input.mouseY;
            
            // Check if placement is valid
            this.placementValid = this.isValidPlacement(input.mouseX, input.mouseY);
            this.placingTower.alpha = this.placementValid ? 0.8 : 0.3;
        }
        
        super.update(dt, input);
        
        // Check wave completion
        if (this.waveInProgress) {
            const enemies = this.findEntities(e => e.constructor.name.includes('Enemy'));
            if (enemies.length === 0 && this.enemiesRemaining === 0) {
                this.waveInProgress = false;
                
                // Award bonus gold for completing wave
                this.gameState.gold += 50 + (this.gameState.wave * 10);
                
                if (this.gameState.isEndless) {
                    this.waveButton.enabled = false;
                    this.nextWaveTimer = this.autoWaveDelaySeconds;
                } else {
                    this.waveButton.enabled = true;
                }
            }
        }
        
        // Auto-start next wave in endless mode
        if (this.gameState.isEndless && !this.waveInProgress && this.nextWaveTimer > 0) {
            this.nextWaveTimer -= dt;
            if (this.nextWaveTimer <= 0) {
                this.startWave();
            }
        }

        // Update enemy count
        const activeEnemies = this.findEntities(e => e.constructor.name.includes('Enemy'));
        this.enemiesRemaining = Math.max(0, this.enemiesRemaining - (this.lastEnemyCount - activeEnemies.length));
        this.lastEnemyCount = activeEnemies.length;
    }
    
    handleClick(event) {
        // Handle tower placement
        if (this.placingTower) {
            if (this.placementValid) {
                // Place tower
                const tower = this.placingTowerFactory(event.x, event.y);
                this.addEntity(tower, 2);
                this.gameState.gold -= this.placingTowerCost;
                
                // Reset placement
                this.placingTower = null;
                this.placingTowerCost = 0;
                this.placingTowerFactory = null;
            }
            return;
        }
        
        super.handleClick(event);
    }
    
    isValidPlacement(x, y) {
        // Check if not on path
        for (let i = 0; i < this.path.length - 1; i++) {
            const p1 = this.path[i];
            const p2 = this.path[i + 1];
            
            const dist = this.pointToLineDistance(x, y, p1.x, p1.y, p2.x, p2.y);
            if (dist < 50) return false;
        }
        
        // Check if not overlapping other towers
        const towers = this.findEntities(e => e.constructor.name.includes('Tower'));
        for (const tower of towers) {
            const dx = tower.x - x;
            const dy = tower.y - y;
            const dist = Math.sqrt(dx * dx + dy * dy);
            if (dist < 60) return false;
        }
        
        // Check bounds
        if (x < 50 || x > 1230 || y < 100 || y > 600) return false;
        
        return true;
    }
    
    pointToLineDistance(px, py, x1, y1, x2, y2) {
        const A = px - x1;
        const B = py - y1;
        const C = x2 - x1;
        const D = y2 - y1;
        
        const dot = A * C + B * D;
        const lenSq = C * C + D * D;
        let param = -1;
        
        if (lenSq !== 0) param = dot / lenSq;
        
        let xx, yy;
        
        if (param < 0) {
            xx = x1;
            yy = y1;
        } else if (param > 1) {
            xx = x2;
            yy = y2;
        } else {
            xx = x1 + param * C;
            yy = y1 + param * D;
        }
        
        const dx = px - xx;
        const dy = py - yy;
        return Math.sqrt(dx * dx + dy * dy);
    }
    
    gameOver(won) {
        setTimeout(() => {
            if (won) {
                alert(`Victory! You defended the castle!\nScore: ${this.gameState.score}`);
            } else {
                alert(`Game Over! The castle has fallen!\nScore: ${this.gameState.score}`);
            }
            this.engine.changeScene('menu');
        }, 100);
    }
    
    render(ctx) {
        // Draw background
        ctx.fillStyle = '#2a3d2a';
        ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
        
        // Draw grass pattern
        ctx.fillStyle = '#3d5a3d';
        for (let i = 0; i < ctx.canvas.width; i += 40) {
            for (let j = 0; j < ctx.canvas.height; j += 40) {
                if ((i + j) % 80 === 0) {
                    ctx.fillRect(i, j, 20, 20);
                }
            }
        }
        
        // Draw path
        ctx.strokeStyle = '#6b5b4a';
        ctx.lineWidth = 80;
        ctx.lineCap = 'round';
        ctx.lineJoin = 'round';
        ctx.beginPath();
        ctx.moveTo(this.path[0].x, this.path[0].y);
        for (let i = 1; i < this.path.length; i++) {
            ctx.lineTo(this.path[i].x, this.path[i].y);
        }
        ctx.stroke();
        
        // Draw path borders
        ctx.strokeStyle = '#5a4a3a';
        ctx.lineWidth = 84;
        ctx.beginPath();
        ctx.moveTo(this.path[0].x, this.path[0].y);
        for (let i = 1; i < this.path.length; i++) {
            ctx.lineTo(this.path[i].x, this.path[i].y);
        }
        ctx.stroke();
        
        // Render entities
        super.render(ctx);
        
        // Draw tower being placed
        if (this.placingTower) {
            this.placingTower.render(ctx);
        }
        
        // Draw HUD
        this.renderHUD(ctx);
    }
    
    renderHUD(ctx) {
        ctx.save();
        
        // Top left - resources
        ctx.fillStyle = '#ffffff';
        ctx.font = 'bold 24px Arial';
        ctx.textAlign = 'left';
        ctx.fillText(`💰 Gold: ${this.gameState.gold}`, 20, 30);
        ctx.fillText(`❤️ Lives: ${this.gameState.lives}`, 20, 60);
        
        // Top center - wave info
        ctx.textAlign = 'center';
        ctx.fillText(`Wave ${this.gameState.wave}${this.gameState.isEndless ? ' (Endless Mode)' : ''}`, 640, 100);
        
        // Top right - score
        ctx.textAlign = 'right';
        ctx.fillText(`Score: ${this.gameState.score}`, 1260, 30);
        
        // Bottom - tower selection
        ctx.fillStyle = 'rgba(0, 0, 0, 0.8)';
        ctx.fillRect(0, 620, 1280, 100);
        
        ctx.fillStyle = '#ffffff';
        ctx.font = '20px Arial';
        ctx.textAlign = 'center';
        ctx.fillText('Build Towers:', 640, 640);
        
        ctx.restore();
    }
}
