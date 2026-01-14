# GameMaker to JavaScript Canvas API Migration Map

This document maps the original GameMaker Studio 2 project structure to the new JavaScript Canvas API implementation.

## Project Overview

**Original**: GameMaker Studio 2 tower defense game
**Target**: JavaScript Canvas API game

## Directory Structure Mapping

| GameMaker | JavaScript |
|-----------|------------|
| `objects/` | `src/entities/` |
| `sprites/` | `assets/images/` |
| `rooms/` | `src/scenes/` |
| `scripts/` | `src/utils/` & inline in classes |
| `fonts/` | `assets/fonts/` |
| `paths/` | Defined in scene classes |

## Core Systems Mapping

### 1. Game Loop

**GameMaker:**
- Step Event (runs every frame)
- Draw Event (renders every frame)

**JavaScript:**
```javascript
// src/core/Engine.js
gameLoop(currentTime) {
    this.update(dt);  // Equivalent to Step Event
    this.render();    // Equivalent to Draw Event
}
```

### 2. Objects to Classes

**GameMaker:**
- Objects are visual instances with events
- Create Event, Step Event, Draw Event, Collision Event, etc.

**JavaScript:**
```javascript
// src/core/Entity.js
class Entity {
    onCreate() {}      // → Create Event
    update(dt) {}      // → Step Event
    render(ctx) {}     // → Draw Event
    destroy() {}       // → Destroy Event
}
```

### 3. Object Mapping

| GameMaker Object | JavaScript Class | File |
|-----------------|------------------|------|
| `obj_tower_arc` | `ArcTower` | `src/entities/Tower.js` |
| `obj_tower_archer` | `ArcherTower` | `src/entities/Tower.js` |
| `obj_arc_chain` | `ArcProjectile` | `src/entities/Projectile.js` |
| `obj_arrow` | `ArrowProjectile` | `src/entities/Projectile.js` |
| `obj_zombie` | `ZombieEnemy` | `src/entities/Enemy.js` |
| `obj_frankenstein` | `FrankensteinEnemy` | `src/entities/Enemy.js` |
| `obj_button_*` | `Button` | `src/ui/Button.js` |
| `obj_gameplay_manager` | `GameScene` | `src/scenes/GameScene.js` |
| `obj_wave_manager` | Built into `GameScene` | `src/scenes/GameScene.js` |

### 4. Rooms to Scenes

| GameMaker Room | JavaScript Scene | File |
|---------------|------------------|------|
| `rm_menu` | `MenuScene` | `src/scenes/MenuScene.js` |
| `rm_level_1` | `GameScene` | `src/scenes/GameScene.js` |

### 5. Function Mapping

| GameMaker (GML) | JavaScript |
|-----------------|------------|
| `instance_create_layer(x, y, layer, obj)` | `scene.addEntity(new Entity(x, y), layer)` |
| `instance_destroy()` | `entity.destroy()` |
| `point_distance(x1, y1, x2, y2)` | `entity.distanceTo(other)` |
| `point_direction(x1, y1, x2, y2)` | `entity.angleTo(other)` |
| `draw_sprite(sprite, frame, x, y)` | `sprite.render(ctx, x, y, frame)` |
| `draw_text(x, y, text)` | `ctx.fillText(text, x, y)` |
| `collision_circle(x, y, radius, obj, ...)` | Custom collision detection |
| `room_goto(room)` | `engine.changeScene('sceneName')` |
| `keyboard_check(key)` | `input.keys.has(key)` |
| `mouse_x`, `mouse_y` | `input.mouseX`, `input.mouseY` |

## Asset Export Process

### 1. Export Sprites from GameMaker

For each sprite in `sprites/` folder:

1. Right-click sprite in GameMaker
2. Select "Export Frames" → "PNG Sequence"
3. Save to `assets/images/[category]/`

**Categories:**
- `towers/` - Tower sprites
- `enemies/` - Enemy sprites
- `projectiles/` - Projectile sprites
- `ui/` - UI elements
- `background/` - Background images
- `effects/` - Visual effects

### 2. Load Sprites in JavaScript

```javascript
// In src/main.js
await assetManager.loadSprite('tower_arc', 'assets/images/towers/arc_tower.png');
await assetManager.loadSprite('enemy_zombie', 'assets/images/enemies/zombie.png', 48, 48);
```

## Events Translation

### Create Event
```javascript
// GameMaker: Create Event
// JavaScript:
onCreate() {
    this.health = 100;
    this.speed = 50;
}
```

### Step Event
```javascript
// GameMaker: Step Event
// JavaScript:
update(dt, input) {
    this.x += this.velocityX * dt;
    this.y += this.velocityY * dt;
}
```

### Draw Event
```javascript
// GameMaker: Draw Event
// JavaScript:
render(ctx) {
    ctx.drawImage(this.sprite, this.x, this.y);
}
```

### Collision Event
```javascript
// GameMaker: Collision Event with obj_enemy
// JavaScript:
update(dt, input) {
    const enemies = this.scene.findEntities(e => e instanceof Enemy);
    for (const enemy of enemies) {
        if (this.collidesWith(enemy)) {
            this.onCollision(enemy);
        }
    }
}
```

## Game State Management

**GameMaker:**
- Global variables
- Persistent objects

**JavaScript:**
```javascript
// In GameScene
this.gameState = {
    gold: 500,
    lives: 20,
    wave: 1,
    score: 0
};
```

## Path System

**GameMaker:**
- Visual path editor
- `path_start()`, `path_position`, etc.

**JavaScript:**
```javascript
// Define path as array of points
this.path = [
    {x: 0, y: 360},
    {x: 300, y: 360},
    {x: 600, y: 200}
];

// Follow path in enemy update
update(dt) {
    const target = this.path[this.pathIndex];
    // Move towards target...
}
```

## Wave System

**GameMaker:**
- `obj_wave_manager` with alarm events

**JavaScript:**
```javascript
startWave() {
    const waveSize = 5 + this.gameState.wave * 3;
    
    for (let i = 0; i < waveSize; i++) {
        setTimeout(() => {
            this.spawnEnemy();
        }, i * 1000);
    }
}
```

## UI System

**GameMaker:**
- Draw GUI Event
- UI objects with collision detection

**JavaScript:**
```javascript
// Button class with click handling
class Button extends Entity {
    handleClick(event) {
        if (this.containsPoint(event.x, event.y)) {
            this.onClick();
        }
    }
}
```

## Key Differences

### 1. Coordinate System
- **GameMaker**: Origin at top-left
- **Canvas API**: Origin at top-left (same)

### 2. Angles
- **GameMaker**: Degrees (0 = right, increases counter-clockwise)
- **Canvas API**: Radians (0 = right, increases clockwise)
  - Convert: `radians = degrees * Math.PI / 180`

### 3. Frame Delta
- **GameMaker**: `delta_time` in microseconds
- **Canvas API**: `dt` in seconds

### 4. Drawing
- **GameMaker**: Individual draw functions
- **Canvas API**: Context-based drawing
  ```javascript
  ctx.fillStyle = 'red';
  ctx.fillRect(x, y, width, height);
  ```

### 5. Collision
- **GameMaker**: Built-in collision functions
- **Canvas API**: Custom implementation needed

## Testing Checklist

- [ ] Menu scene displays correctly
- [ ] Start button transitions to game
- [ ] Path is visible and correct
- [ ] Towers can be placed
- [ ] Towers detect and shoot at enemies
- [ ] Projectiles move and hit enemies
- [ ] Enemies follow path
- [ ] Health bars display correctly
- [ ] Gold and lives update
- [ ] Waves progress correctly
- [ ] Game over conditions work
- [ ] Win condition works

## Performance Considerations

1. **Object Pooling**: Reuse projectile objects instead of creating/destroying
2. **Spatial Partitioning**: Use quadtree for collision detection if many entities
3. **Sprite Batching**: Group similar draw calls
4. **Delta Time**: Always use delta time for smooth gameplay
5. **RAF**: Use `requestAnimationFrame` for game loop

## Future Enhancements

- [ ] Export and integrate actual GameMaker sprites
- [ ] Add sound effects and music
- [ ] Implement particle effects
- [ ] Add save/load system
- [ ] Create level editor
- [ ] Add more tower types
- [ ] Implement tower upgrades UI
- [ ] Add special abilities
- [ ] Create more enemy types
- [ ] Add boss waves

## Running the Game

1. **Local Development:**
   ```bash
   # Install http-server
   npm install -g http-server
   
   # Run from project root
   http-server -p 8080
   
   # Open in browser
   open http://localhost:8080
   ```

2. **Production Build:**
   - Bundle with webpack/rollup
   - Minify JavaScript
   - Optimize images
   - Deploy to static hosting

## Troubleshooting

### Common Issues

1. **Sprites not loading:**
   - Check file paths are correct
   - Ensure CORS headers if serving from different domain
   - Verify image files exist

2. **Game running too fast/slow:**
   - Check delta time calculations
   - Ensure RAF is used correctly
   - Cap delta time to prevent spiral of death

3. **Collision not working:**
   - Verify entity bounds (width/height)
   - Check collision detection logic
   - Use debug rendering to visualize hitboxes

4. **Memory leaks:**
   - Ensure entities are properly cleaned up
   - Remove event listeners in cleanup()
   - Clear references to destroyed entities

## Resources

- [Canvas API Documentation](https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API)
- [GameMaker to Web Migration Guide](https://docs.yoyogames.com/)
- [JavaScript Game Development Best Practices](https://developer.mozilla.org/en-US/docs/Games)
