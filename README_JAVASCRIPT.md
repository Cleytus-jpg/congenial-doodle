# Tower Defense - JavaScript Canvas API

A tower defense game converted from GameMaker Studio 2 to JavaScript using the Canvas API.

## Project Structure

```
/workspaces/congenial-doodle/
├── index.html                 # Main HTML file
├── src/
│   ├── main.js               # Game entry point
│   ├── core/                 # Core engine
│   │   ├── Engine.js         # Main game engine
│   │   ├── Scene.js          # Scene management
│   │   ├── Entity.js         # Base entity class
│   │   └── Sprite.js         # Sprite & asset management
│   ├── entities/             # Game entities
│   │   ├── Tower.js          # Tower classes
│   │   ├── Enemy.js          # Enemy classes
│   │   └── Projectile.js     # Projectile classes
│   ├── scenes/               # Game scenes
│   │   ├── MenuScene.js      # Main menu
│   │   └── GameScene.js      # Main gameplay
│   └── ui/                   # UI components
│       └── Button.js         # Button & UI elements
├── assets/
│   ├── images/               # Sprite images
│   ├── fonts/                # Custom fonts
│   └── audio/                # Sound effects & music
└── MIGRATION_MAP.md          # Migration documentation

## Original GameMaker Project

This repository contains the original GameMaker Studio 2 project files:
- `objects/` - Original game objects
- `sprites/` - Original sprite files
- `rooms/` - Original room layouts
- `scripts/` - Original GML scripts

See [MIGRATION_MAP.md](MIGRATION_MAP.md) for detailed conversion documentation.
```

## Getting Started

### Prerequisites

- A modern web browser (Chrome, Firefox, Safari, or Edge)
- A local web server (required for ES6 modules)

### Running the Game

1. **Install a local web server:**

   ```bash
   # Using Python 3
   python3 -m http.server 8080
   
   # Or using Node.js http-server
   npm install -g http-server
   http-server -p 8080
   ```

2. **Open in browser:**

   Navigate to `http://localhost:8080` in your web browser.

3. **Play:**
   - Click "Start Game" from the main menu
   - Select a tower type from the bottom panel
   - Click on the map to place the tower
   - Click "Start Wave" to begin the wave
   - Defend your castle!

## Game Features

### Towers

- **Archer Tower** ($100)
  - Medium range
  - Single target damage
  - Good all-around tower

- **Arc Tower** ($150)
  - Chain lightning effect
  - Hits multiple enemies
  - Higher damage

### Enemies

- **Zombie** - Basic slow enemy
- **Fast Enemy** - Quick but weak
- **Frankenstein** - Tanky with high health

### Gameplay

- 10 waves of increasing difficulty
- Place towers strategically along the path
- Earn gold by defeating enemies
- Upgrade towers for better performance
- Don't let enemies reach the end!

## Controls

- **Mouse**: Click to interact with buttons and place towers
- **Left Click**: Select and place towers

## Development

### File Structure

- **Core Engine** (`src/core/`):
  - `Engine.js` - Main game loop, input handling, scene management
  - `Scene.js` - Base scene class for menu and game states
  - `Entity.js` - Base entity class for all game objects
  - `Sprite.js` - Sprite rendering and asset management

- **Game Logic** (`src/entities/`):
  - `Tower.js` - Tower behavior and targeting
  - `Enemy.js` - Enemy movement and health
  - `Projectile.js` - Projectile movement and collision

- **Scenes** (`src/scenes/`):
  - `MenuScene.js` - Main menu interface
  - `GameScene.js` - Core gameplay logic

### Adding New Content

#### Adding a New Tower

```javascript
// In src/entities/Tower.js
export class MageTower extends Tower {
    constructor(x, y) {
        super(x, y, 'mage');
        this.range = 200;
        this.damage = 30;
        this.fireRate = 0.5;
        this.cost = 200;
    }
    
    shoot() {
        // Custom shooting logic
    }
}
```

#### Adding a New Enemy

```javascript
// In src/entities/Enemy.js
export class BossEnemy extends Enemy {
    constructor(x, y, path) {
        super(x, y, path);
        this.speed = 20;
        this.health = 1000;
        this.maxHealth = 1000;
        this.reward = 100;
    }
}
```

### Asset Integration

To replace placeholder sprites with actual images:

1. Export sprites from GameMaker or create new ones
2. Place images in `assets/images/[category]/`
3. Update `src/main.js`:

```javascript
await assetManager.loadSprite('tower_mage', 'assets/images/towers/mage_tower.png');
```

## Architecture

### Game Loop

```
Engine.gameLoop()
  ↓
Engine.update(dt)
  ↓
Scene.update(dt, input)
  ↓
Entity.update(dt, input)
  ↓
Engine.render()
  ↓
Scene.render(ctx)
  ↓
Entity.render(ctx)
```

### Entity System

All game objects inherit from `Entity`:
- Position (x, y)
- Velocity
- Rotation, scale, alpha
- Collision detection
- Lifecycle methods

### Scene Management

Scenes represent different game states:
- `MenuScene` - Main menu
- `GameScene` - Active gameplay
- Can add: `PauseScene`, `GameOverScene`, etc.

## Performance

- Uses `requestAnimationFrame` for smooth 60 FPS
- Delta time calculation for frame-independent movement
- Entity pooling for projectiles (recommended for optimization)
- Layered rendering system for proper z-ordering

## Browser Compatibility

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

Requires ES6 module support.

## Known Issues

- Sprites are currently colored rectangles (placeholders)
- No sound effects yet
- Tower upgrade UI not fully implemented

## Future Enhancements

- [ ] Integrate actual sprite graphics
- [ ] Add sound effects and background music
- [ ] Implement particle effects
- [ ] Add tower upgrade interface
- [ ] Create pause menu
- [ ] Add difficulty levels
- [ ] Implement save/load system
- [ ] Add achievements
- [ ] Create more levels

## License

[Your License Here]

## Credits

- Original GameMaker project: [Your Name]
- JavaScript conversion: [Your Name]
- Assets: [Asset credits]

## Contributing

Contributions are welcome! Please feel free to submit pull requests.

## Support

For issues or questions, please open an issue on GitHub.
