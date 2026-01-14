class WaveManager {
  constructor(opts) {
    opts = opts || {};
    this.spawnEnemy = opts.spawnEnemy || (() => {});
    this.intermissionMs = opts.intermissionMs ?? 10000;
    this.baseEnemies = opts.baseEnemies ?? 5;
    this.perWaveIncrement = opts.perWaveIncrement ?? 2;
    this.baseSpawnIntervalMs = opts.baseSpawnIntervalMs ?? 800;
    this.minSpawnIntervalMs = opts.minSpawnIntervalMs ?? 200;
    this.spawnAccelPerWaveMs = opts.spawnAccelPerWaveMs ?? 50;
    this.onWaveStart = opts.onWaveStart || (() => {});
    this.onWaveComplete = opts.onWaveComplete || (() => {});
    this.onIntermission = opts.onIntermission || (() => {});
    this.onEnemySpawned = opts.onEnemySpawned || (() => {});
    this._resetState();
  }

  _resetState() {
    this.wave = 0;
    this.running = false;
    this.paused = false;
    this._spawned = 0;
    this._toSpawn = 0;
    this._active = 0;
    this._spawnTimer = null;
    this._intermissionTimer = null;
  }

  start() {
    if (this.running) return;
    this.running = true;
    this.wave = 1;
    this._beginWave();
  }

  stop() {
    this.running = false;
    this.paused = false;
    clearInterval(this._spawnTimer);
    clearTimeout(this._intermissionTimer);
    this._spawnTimer = null;
    this._intermissionTimer = null;
  }

  pause() {
    if (!this.running || this.paused) return;
    this.paused = true;
    clearInterval(this._spawnTimer);
  }

  resume() {
    if (!this.running || !this.paused) return;
    this.paused = false;
    if (this._spawned < this._toSpawn) this._startSpawnLoop();
  }

  // Call this from your enemy death handler
  onEnemyKilled() {
    if (!this.running) return;
    this._active = Math.max(0, this._active - 1);
    this._maybeCompleteWave();
  }

  _beginWave() {
    this._spawned = 0;
    this._toSpawn = this._calcEnemiesForWave(this.wave);
    this._active = 0;
    const interval = this._calcSpawnIntervalForWave(this.wave);
    this.onWaveStart({ wave: this.wave, count: this._toSpawn, spawnIntervalMs: interval });
    this._startSpawnLoop(interval);
  }

  _startSpawnLoop(intervalOverride) {
    const interval = intervalOverride ?? this._calcSpawnIntervalForWave(this.wave);
    clearInterval(this._spawnTimer);
    this._spawnTimer = setInterval(() => {
      if (this.paused) return;
      if (this._spawned >= this._toSpawn) {
        clearInterval(this._spawnTimer);
        this._spawnTimer = null;
        this._maybeCompleteWave();
        return;
      }
      this._spawnEnemy();
    }, interval);
  }

  _spawnEnemy() {
    this._spawned += 1;
    this._active += 1;
    const info = { wave: this.wave, index: this._spawned, remainingToSpawn: this._toSpawn - this._spawned };
    try {
      const enemy = this.spawnEnemy(info);
      this.onEnemySpawned({ ...info, enemy });
    } catch (_) {}
    if (this._spawned >= this._toSpawn) {
      clearInterval(this._spawnTimer);
      this._spawnTimer = null;
    }
  }

  _maybeCompleteWave() {
    if (this._spawned >= this._toSpawn && this._active === 0 && !this._intermissionTimer) {
      this.onWaveComplete({ wave: this.wave });
      this._scheduleIntermission();
    }
  }

  _scheduleIntermission() {
    const ms = this.intermissionMs;
    this.onIntermission({ waveJustCompleted: this.wave, ms });
    this._intermissionTimer = setTimeout(() => {
      this._intermissionTimer = null;
      if (!this.running) return;
      this.wave += 1;
      this._beginWave();
    }, ms);
  }

  _calcEnemiesForWave(w) {
    return Math.max(1, Math.floor(this.baseEnemies + this.perWaveIncrement * (w - 1)));
  }

  _calcSpawnIntervalForWave(w) {
    const interval = this.baseSpawnIntervalMs - this.spawnAccelPerWaveMs * (w - 1);
    return Math.max(this.minSpawnIntervalMs, interval);
  }
}

// CommonJS + browser global
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { WaveManager };
} else {
  // eslint-disable-next-line no-undef
  this.WaveManager = WaveManager;
}
