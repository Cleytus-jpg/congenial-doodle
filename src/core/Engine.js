/**
 * Main game engine using Canvas API
 * Manages game loop, scenes, and core systems
 */
export class Engine {
    constructor(canvasId, width = 1280, height = 720) {
        this.canvas = document.getElementById(canvasId);
        this.ctx = this.canvas.getContext('2d');
        this.canvas.width = width;
        this.canvas.height = height;
        
        this.running = false;
        this.lastTime = 0;
        this.deltaTime = 0;
        this.fps = 60;
        this.frameCount = 0;
        this.fpsDisplay = 0;
        this.fpsTimer = 0;
        
        this.currentScene = null;
        this.scenes = new Map();
        
        // Input handling
        this.input = {
            mouseX: 0,
            mouseY: 0,
            mouseDown: false,
            keys: new Set()
        };
        
        this.setupInputListeners();
    }
    
    setupInputListeners() {
        this.canvas.addEventListener('mousemove', (e) => {
            const rect = this.canvas.getBoundingClientRect();
            this.input.mouseX = e.clientX - rect.left;
            this.input.mouseY = e.clientY - rect.top;
        });
        
        this.canvas.addEventListener('mousedown', (e) => {
            this.input.mouseDown = true;
        });
        
        this.canvas.addEventListener('mouseup', (e) => {
            this.input.mouseDown = false;
        });
        
        this.canvas.addEventListener('click', (e) => {
            const rect = this.canvas.getBoundingClientRect();
            const clickEvent = {
                x: e.clientX - rect.left,
                y: e.clientY - rect.top
            };
            if (this.currentScene) {
                this.currentScene.handleClick(clickEvent);
            }
        });
        
        window.addEventListener('keydown', (e) => {
            this.input.keys.add(e.key.toLowerCase());
        });
        
        window.addEventListener('keyup', (e) => {
            this.input.keys.delete(e.key.toLowerCase());
        });
    }
    
    start() {
        this.running = true;
        this.lastTime = performance.now();
        this.gameLoop(this.lastTime);
    }
    
    stop() {
        this.running = false;
    }
    
    gameLoop(currentTime) {
        if (!this.running) return;
        
        this.deltaTime = (currentTime - this.lastTime) / 1000;
        this.lastTime = currentTime;
        
        // Cap delta time to prevent spiral of death
        if (this.deltaTime > 0.1) {
            this.deltaTime = 0.1;
        }
        
        this.update(this.deltaTime);
        this.render();
        
        // FPS counter
        this.frameCount++;
        this.fpsTimer += this.deltaTime;
        if (this.fpsTimer >= 1) {
            this.fpsDisplay = this.frameCount;
            this.frameCount = 0;
            this.fpsTimer = 0;
        }
        
        requestAnimationFrame((time) => this.gameLoop(time));
    }
    
    update(dt) {
        if (this.currentScene) {
            this.currentScene.update(dt, this.input);
        }
    }
    
    render() {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        
        if (this.currentScene) {
            this.currentScene.render(this.ctx);
        }
        
        // Optional: Draw FPS counter
        // this.drawFPS();
    }
    
    drawFPS() {
        this.ctx.save();
        this.ctx.fillStyle = 'yellow';
        this.ctx.font = '16px monospace';
        this.ctx.textAlign = 'right';
        this.ctx.fillText(`FPS: ${this.fpsDisplay}`, this.canvas.width - 10, 20);
        this.ctx.restore();
    }
    
    addScene(name, scene) {
        this.scenes.set(name, scene);
        scene.engine = this;
    }
    
    changeScene(name) {
        if (this.currentScene) {
            this.currentScene.onExit();
        }
        
        this.currentScene = this.scenes.get(name);
        
        if (this.currentScene) {
            this.currentScene.onEnter();
        } else {
            console.error(`Scene "${name}" not found!`);
        }
    }
}
