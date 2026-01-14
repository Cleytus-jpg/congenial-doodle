import { Engine } from './core/Engine.js';
import { AssetManager } from './core/Sprite.js';
import { MenuScene } from './scenes/MenuScene.js';
import { GameScene } from './scenes/GameScene.js';
import { PixelArtGenerator } from './utils/PixelArt.js';

/**
 * Main entry point for the game
 */
async function init() {
    console.log('Initializing Tower Defense Game...');
    
    // Hide loading screen after assets load
    const loadingElement = document.getElementById('loading');
    
    try {
        // Create engine
        const engine = new Engine('gameCanvas', 1280, 720);
        const assetManager = new AssetManager();
        
        // Create pixel art sprites
        console.log('Creating pixel art assets...');
        
        // Create pixel art sprites using generator
        await assetManager.loadSprite('tower_arc', PixelArtGenerator.createArcTower());
        await assetManager.loadSprite('tower_archer', PixelArtGenerator.createArcherTower());
        await assetManager.loadSprite('enemy_zombie', PixelArtGenerator.createZombie());
        await assetManager.loadSprite('enemy_frankenstein', PixelArtGenerator.createFrankenstein());
        await assetManager.loadSprite('enemy_fast', PixelArtGenerator.createFastEnemy());
        await assetManager.loadSprite('projectile_arrow', PixelArtGenerator.createArrow());
        await assetManager.loadSprite('projectile_arc', PixelArtGenerator.createArcProjectile());
        
        // TODO: When you have actual sprite images, load them like this:
        /*
        await assetManager.loadSprite('tower_arc', 'assets/images/towers/arc_tower.png');
        await assetManager.loadSprite('tower_archer', 'assets/images/towers/archer_tower.png');
        await assetManager.loadSprite('enemy_zombie', 'assets/images/enemies/zombie.png');
        await assetManager.loadSprite('enemy_frankenstein', 'assets/images/enemies/frankenstein.png');
        await assetManager.loadSprite('projectile_arrow', 'assets/images/projectiles/arrow.png');
        await assetManager.loadSprite('projectile_arc', 'assets/images/projectiles/arc.png');
        */
        
        console.log('Assets loaded!');
        
        // Make assetManager globally accessible
        window.assetManager = assetManager;
        
        // Create scenes
        const menuScene = new MenuScene();
        const gameScene = new GameScene();
        
        engine.addScene('menu', menuScene);
        engine.addScene('game', gameScene);
        
        // Start with menu
        engine.changeScene('menu');
        engine.start();
        
        // Hide loading screen
        loadingElement.classList.add('hidden');
        
        console.log('Game started!');
        console.log('Controls:');
        console.log('- Click on tower buttons to select a tower');
        console.log('- Click on the map to place the tower');
        console.log('- Click "Start Wave" to begin the wave');
        
    } catch (error) {
        console.error('Failed to initialize game:', error);
        loadingElement.textContent = 'Failed to load game. Check console for details.';
    }
}

// Start the game when page loads
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
} else {
    init();
}
