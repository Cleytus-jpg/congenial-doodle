/**
 * Base Scene class - represents a game state/screen
 * Examples: MenuScene, GameScene, PauseScene
 */
export class Scene {
    constructor(name) {
        this.name = name;
        this.engine = null;
        this.entities = [];
        this.layers = new Map();
        this.initialized = false;
    }
    
    /**
     * Called when scene becomes active
     */
    onEnter() {
        this.initialized = true;
    }
    
    /**
     * Called when scene is exited
     */
    onExit() {
        // Clean up entities
        for (const entity of this.entities) {
            if (entity.cleanup) {
                entity.cleanup();
            }
        }
    }
    
    /**
     * Add entity to scene with optional layer for render order
     */
    addEntity(entity, layer = 0) {
        this.entities.push(entity);
        entity.scene = this;
        
        if (!this.layers.has(layer)) {
            this.layers.set(layer, []);
        }
        this.layers.get(layer).push(entity);
        
        if (entity.onCreate) {
            entity.onCreate();
        }
    }
    
    /**
     * Remove entity from scene
     */
    removeEntity(entity) {
        const index = this.entities.indexOf(entity);
        if (index > -1) {
            this.entities.splice(index, 1);
        }
        
        // Remove from layers
        for (const [layer, entities] of this.layers) {
            const layerIndex = entities.indexOf(entity);
            if (layerIndex > -1) {
                entities.splice(layerIndex, 1);
            }
        }
        
        if (entity.cleanup) {
            entity.cleanup();
        }
    }
    
    /**
     * Find entities by type or filter function
     */
    findEntities(filterFn) {
        return this.entities.filter(filterFn);
    }
    
    /**
     * Handle mouse click events
     */
    handleClick(event) {
        // Pass to entities (buttons, etc.)
        for (const entity of this.entities) {
            if (entity.handleClick && entity.active) {
                entity.handleClick(event);
            }
        }
    }
    
    /**
     * Update all entities
     */
    update(dt, input) {
        // Update entities
        for (let i = this.entities.length - 1; i >= 0; i--) {
            const entity = this.entities[i];
            if (entity.active && !entity.destroyed) {
                entity.update(dt, input);
            }
        }
        
        // Remove destroyed entities
        this.entities = this.entities.filter(e => !e.destroyed);
        
        // Clean up layers
        for (const [layer, entities] of this.layers) {
            this.layers.set(layer, entities.filter(e => !e.destroyed));
        }
    }
    
    /**
     * Render all entities in layer order
     */
    render(ctx) {
        // Sort layers and render
        const sortedLayers = Array.from(this.layers.keys()).sort((a, b) => a - b);
        
        for (const layer of sortedLayers) {
            const entities = this.layers.get(layer);
            for (const entity of entities) {
                if (entity.visible && !entity.destroyed) {
                    entity.render(ctx);
                }
            }
        }
    }
}
