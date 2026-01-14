const { WaveManager } = require('../src/waveManager');

describe('WaveManager - Endless Game Tests', () => {
  let wm;
  let spawnedEnemies;
  let callbacks;

  beforeEach(() => {
    spawnedEnemies = [];
    callbacks = {
      onWaveStart: [],
      onWaveComplete: [],
      onIntermission: [],
      onEnemySpawned: []
    };

    wm = new WaveManager({
      intermissionMs: 100, // Fast for testing
      baseEnemies: 3,
      perWaveIncrement: 2,
      baseSpawnIntervalMs: 50,
      minSpawnIntervalMs: 10,
      spawnAccelPerWaveMs: 5,
      spawnEnemy: (info) => {
        const enemy = { id: spawnedEnemies.length, ...info };
        spawnedEnemies.push(enemy);
        return enemy;
      },
      onWaveStart: (info) => callbacks.onWaveStart.push(info),
      onWaveComplete: (info) => callbacks.onWaveComplete.push(info),
      onIntermission: (info) => callbacks.onIntermission.push(info),
      onEnemySpawned: (info) => callbacks.onEnemySpawned.push(info)
    });
  });

  afterEach(() => {
    if (wm) wm.stop();
  });

  describe('Core Endless Mechanics', () => {
    test('should continuously generate waves without stopping', async () => {
      wm.start();
      
      // Wait for first wave to spawn
      await waitFor(() => spawnedEnemies.length >= 3, 500);
      
      // Kill all wave 1 enemies
      for (let i = 0; i < 3; i++) wm.onEnemyKilled();
      
      // Wait for intermission and wave 2
      await waitFor(() => callbacks.onWaveStart.length >= 2, 500);
      
      // Wave 2 should spawn more enemies (3 + 2 = 5)
      await waitFor(() => spawnedEnemies.length >= 8, 500);
      
      // Kill all wave 2 enemies
      for (let i = 0; i < 5; i++) wm.onEnemyKilled();
      
      // Wait for wave 3
      await waitFor(() => callbacks.onWaveStart.length >= 3, 500);
      
      expect(wm.wave).toBeGreaterThanOrEqual(3);
      expect(wm.running).toBe(true);
    }, 3000);

    test('should increment wave number indefinitely', async () => {
      wm.start();
      
      for (let wave = 1; wave <= 5; wave++) {
        await waitFor(() => callbacks.onWaveStart.length >= wave, 1000);
        const expectedCount = 3 + 2 * (wave - 1);
        
        // Wait for all enemies in this wave to spawn
        await waitFor(() => callbacks.onEnemySpawned.filter(e => e.wave === wave).length >= expectedCount, 1200);
        
        // Kill all enemies in this wave
        for (let i = 0; i < expectedCount; i++) {
          wm.onEnemyKilled();
        }
        
        if (wave < 5) {
          await new Promise(resolve => setTimeout(resolve, 200));
        }
      }
      
      expect(wm.wave).toBeGreaterThanOrEqual(5);
      expect(callbacks.onWaveStart.length).toBeGreaterThanOrEqual(5);
    }, 15000);

    test('should never have a final wave', async () => {
      wm.start();
      
      // Simulate 10 complete waves
      for (let wave = 1; wave <= 10; wave++) {
        await waitFor(() => spawnedEnemies.length >= getExpectedTotalEnemies(wave), 2000);
        
        const enemiesInWave = 3 + 2 * (wave - 1);
        for (let i = 0; i < enemiesInWave; i++) {
          wm.onEnemyKilled();
        }
        
        await new Promise(resolve => setTimeout(resolve, 150));
      }
      
      // Game should still be running
      expect(wm.running).toBe(true);
      expect(wm.wave).toBeGreaterThanOrEqual(10);
    }, 20000);
  });

  describe('Wave Progression', () => {
    test('should increase enemy count each wave', async () => {
      wm.start();
      
      const waveCounts = [];
      
      for (let wave = 1; wave <= 5; wave++) {
        await waitFor(() => callbacks.onWaveStart.length >= wave, 1000);
        const waveInfo = callbacks.onWaveStart[wave - 1];
        waveCounts.push(waveInfo.count);
        
        // Wait for all enemies in this wave to spawn
        await waitFor(() => callbacks.onEnemySpawned.filter(e => e.wave === wave).length >= waveInfo.count, 1200);
        
        // Kill all enemies in this wave
        for (let j = 0; j < waveInfo.count; j++) {
          wm.onEnemyKilled();
        }
        
        if (wave < 5) await new Promise(resolve => setTimeout(resolve, 200));
      }
      
      expect(waveCounts[0]).toBe(3);
      expect(waveCounts[1]).toBe(5);
      expect(waveCounts[2]).toBe(7);
      expect(waveCounts[3]).toBe(9);
      expect(waveCounts[4]).toBe(11);
    }, 15000);

    test('should decrease spawn interval each wave (up to minimum)', async () => {
      wm.start();
      
      await waitFor(() => callbacks.onWaveStart.length >= 1, 500);
      const wave1Interval = callbacks.onWaveStart[0].spawnIntervalMs;
      
      // Wait for wave 1 enemies to spawn
      await waitFor(() => callbacks.onEnemySpawned.length >= 3, 500);
      
      // Kill all enemies
      for (let i = 0; i < 3; i++) wm.onEnemyKilled();
      
      await waitFor(() => callbacks.onWaveStart.length >= 2, 1500);
      const wave2Interval = callbacks.onWaveStart[1].spawnIntervalMs;
      
      // Interval should decrease (faster spawning)
      expect(wave2Interval).toBeLessThan(wave1Interval);
      
      // But never below minimum
      expect(wave2Interval).toBeGreaterThanOrEqual(10);
    }, 5000);
  });

  describe('Intermission Timing', () => {
    test('should have intermission between all waves', async () => {
      wm.start();
      
      // Complete wave 1
      await waitFor(() => spawnedEnemies.length >= 3, 500);
      for (let i = 0; i < 3; i++) wm.onEnemyKilled();
      
      // Should trigger intermission
      await waitFor(() => callbacks.onIntermission.length >= 1, 500);
      expect(callbacks.onIntermission[0].waveJustCompleted).toBe(1);
      expect(callbacks.onIntermission[0].ms).toBe(100);
      
      // Complete wave 2
      await waitFor(() => callbacks.onWaveStart.length >= 2, 500);
      await waitFor(() => spawnedEnemies.length >= 8, 500);
      for (let i = 0; i < 5; i++) wm.onEnemyKilled();
      
      // Should trigger another intermission
      await waitFor(() => callbacks.onIntermission.length >= 2, 500);
      expect(callbacks.onIntermission[1].waveJustCompleted).toBe(2);
    }, 5000);

    test('intermission should always precede next wave', async () => {
      wm.start();
      
      for (let wave = 1; wave <= 3; wave++) {
        await waitFor(() => callbacks.onWaveStart.length >= wave, 1000);
        
        // Wait for enemies to spawn
        const expectedSpawned = callbacks.onEnemySpawned.length + (3 + 2 * (wave - 1));
        await waitFor(() => callbacks.onEnemySpawned.length >= expectedSpawned, 1000);
        
        const enemyCount = 3 + 2 * (wave - 1);
        
        // Complete wave by killing enemies
        const enemiesThisWave = callbacks.onEnemySpawned.filter(e => e.wave === wave).length;
        for (let i = 0; i < enemiesThisWave; i++) {
          wm.onEnemyKilled();
        }
        
        if (wave < 3) {
          await waitFor(() => callbacks.onIntermission.length >= wave, 500);
          expect(callbacks.onIntermission[wave - 1].waveJustCompleted).toBe(wave);
        }
      }
    }, 10000);
  });

  describe('State Management', () => {
    test('should maintain running state across all waves', async () => {
      wm.start();
      expect(wm.running).toBe(true);
      
      for (let wave = 1; wave <= 5; wave++) {
        await waitFor(() => callbacks.onWaveStart.length >= wave, 1000);
        expect(wm.running).toBe(true);
        
        const waveInfo = callbacks.onWaveStart[wave - 1];
        const enemyCount = waveInfo.count;
        
        await waitFor(() => callbacks.onEnemySpawned.filter(e => e.wave === wave).length >= enemyCount, 1200);
        
        for (let i = 0; i < enemyCount; i++) {
          wm.onEnemyKilled();
        }
        
        if (wave < 5) await new Promise(resolve => setTimeout(resolve, 200));
        expect(wm.running).toBe(true);
      }
    }, 15000);

    test('should allow pause and resume at any wave', async () => {
      wm.start();
      
      await waitFor(() => callbacks.onWaveStart.length >= 1, 500);
      await new Promise(resolve => setTimeout(resolve, 50));
      
      wm.pause();
      expect(wm.paused).toBe(true);
      
      const spawnedBeforePause = spawnedEnemies.length;
      await new Promise(resolve => setTimeout(resolve, 100));
      
      // Should not spawn while paused
      expect(spawnedEnemies.length).toBe(spawnedBeforePause);
      
      wm.resume();
      expect(wm.paused).toBe(false);
      
      // Should continue spawning
      await waitFor(() => spawnedEnemies.length > spawnedBeforePause, 200);
    }, 3000);
  });

  describe('Edge Cases', () => {
    test('should handle very high wave numbers', () => {
      wm.wave = 1000;
      const enemyCount = wm._calcEnemiesForWave(1000);
      const spawnInterval = wm._calcSpawnIntervalForWave(1000);
      
      // Should still calculate reasonable values
      expect(enemyCount).toBeGreaterThan(0);
      expect(spawnInterval).toBe(wm.minSpawnIntervalMs); // Should hit minimum
    });

    test('should never stop automatically', async () => {
      wm.start();
      
      for (let i = 0; i < 3; i++) {
        await waitFor(() => callbacks.onWaveStart.length > i, 1000);
        
        const waveInfo = callbacks.onWaveStart[i];
        const enemyCount = waveInfo.count;
        const waveNum = waveInfo.wave;
        
        await waitFor(() => callbacks.onEnemySpawned.filter(e => e.wave === waveNum).length >= enemyCount, 1200);
        
        for (let j = 0; j < enemyCount; j++) {
          wm.onEnemyKilled();
        }
        await new Promise(resolve => setTimeout(resolve, 200));
      }
      
      expect(wm.running).toBe(true);
      expect(wm._spawnTimer !== null || wm._intermissionTimer !== null).toBe(true);
    }, 10000);

    test('should handle rapid enemy deaths', async () => {
      wm.start();
      
      await waitFor(() => spawnedEnemies.length >= 3, 500);
      
      // Kill all enemies immediately
      wm.onEnemyKilled();
      wm.onEnemyKilled();
      wm.onEnemyKilled();
      
      // Should transition to next wave
      await waitFor(() => callbacks.onWaveStart.length >= 2, 500);
      expect(wm.wave).toBeGreaterThanOrEqual(2);
    }, 3000);
  });

  describe('Mathematical Verification', () => {
    test('enemy count formula should be endless', () => {
      const counts = [];
      for (let wave = 1; wave <= 100; wave++) {
        counts.push(wm._calcEnemiesForWave(wave));
      }
      
      // Should always increase
      for (let i = 1; i < counts.length; i++) {
        expect(counts[i]).toBeGreaterThan(counts[i - 1]);
      }
      
      // Should never plateau
      expect(counts[counts.length - 1]).toBe(3 + 2 * 99); // 201 enemies at wave 100
    });

    test('spawn interval should converge to minimum', () => {
      const intervals = [];
      for (let wave = 1; wave <= 20; wave++) {
        intervals.push(wm._calcSpawnIntervalForWave(wave));
      }
      
      // Should decrease or stay at minimum
      for (let i = 1; i < intervals.length; i++) {
        expect(intervals[i]).toBeLessThanOrEqual(intervals[i - 1]);
      }
      
      // Should eventually hit minimum
      expect(intervals[intervals.length - 1]).toBe(wm.minSpawnIntervalMs);
    });
  });
});

// Helper functions
function waitFor(condition, timeout) {
  return new Promise((resolve, reject) => {
    const start = Date.now();
    const interval = setInterval(() => {
      if (condition()) {
        clearInterval(interval);
        resolve();
      } else if (Date.now() - start > timeout) {
        clearInterval(interval);
        reject(new Error(`Timeout waiting for condition`));
      }
    }, 10);
  });
}

function getExpectedTotalEnemies(upToWave) {
  let total = 0;
  for (let w = 1; w <= upToWave; w++) {
    total += 3 + 2 * (w - 1);
  }
  return total;
}
