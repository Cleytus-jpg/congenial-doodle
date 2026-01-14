const { WaveManager } = require('../src/waveManager');

const wm = new WaveManager({
  intermissionMs: 10000,
  baseEnemies: 5,
  perWaveIncrement: 3,
  baseSpawnIntervalMs: 700,
  minSpawnIntervalMs: 150,
  spawnAccelPerWaveMs: 40,
  spawnEnemy: ({ wave, index }) => {
    // ...replace with your real spawn...
    console.log(`Spawn enemy ${index} (wave ${wave})`);
    const ttl = 500 + Math.random() * 1200; // fake lifetime
    setTimeout(() => wm.onEnemyKilled(), ttl);
    return { wave, index };
  },
  onWaveStart: ({ wave, count }) => console.log(`Wave ${wave} start: ${count} enemies`),
  onEnemySpawned: ({ wave, index }) => {}, // e.g., update UI
  onWaveComplete: ({ wave }) => console.log(`Wave ${wave} complete`),
  onIntermission: ({ ms, waveJustCompleted }) =>
    console.log(`Intermission ${ms / 1000}s after wave ${waveJustCompleted}`),
});

wm.start();
