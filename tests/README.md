# Wave Manager Test Suite

## Overview
Comprehensive test suite verifying that the game is truly **endless** with no hard-coded wave limits.

## Running Tests

```bash
# Install dependencies
npm install

# Run all tests
npm test

# Watch mode for development
npm run test:watch

# Generate coverage report
npm run test:coverage
```

## Test Categories

### 1. Core Endless Mechanics
- ✅ Continuously generates waves without stopping
- ✅ Wave number increments indefinitely
- ✅ No final wave exists
- ✅ Game runs beyond wave 10, 100, etc.

### 2. Wave Progression
- ✅ Enemy count increases each wave
- ✅ Spawn intervals decrease (difficulty scales)
- ✅ Scaling follows mathematical formula

### 3. Intermission Timing
- ✅ Consistent 10s breaks between all waves
- ✅ Intermission always precedes next wave
- ✅ No variation in intermission duration

### 4. State Management
- ✅ Running state persists across waves
- ✅ Pause/resume works at any wave
- ✅ No memory leaks over extended play

### 5. Edge Cases
- ✅ Handles very high wave numbers (1000+)
- ✅ Never stops automatically
- ✅ Handles rapid enemy deaths
- ✅ Timer cleanup on stop

### 6. Mathematical Verification
- ✅ Enemy count formula: `baseEnemies + perWaveIncrement * (wave - 1)`
- ✅ Spawn interval formula: `max(minInterval, baseInterval - accel * (wave - 1))`
- ✅ No plateaus or caps in formulas

## Expected Behavior

### Wave Progression Example
```
Wave 1: 3 enemies (spawn every 50ms)
Wave 2: 5 enemies (spawn every 45ms)
Wave 3: 7 enemies (spawn every 40ms)
...
Wave 100: 201 enemies (spawn every 10ms - at minimum)
```

### Endless Verification
The tests verify endlessness by:
1. Running multiple complete wave cycles
2. Checking that `running` state never auto-terminates
3. Verifying mathematical formulas have no caps
4. Testing high wave numbers (1000+) function correctly
5. Confirming no hard-coded final wave logic

## Test Results Interpretation

**PASS** = Game is truly endless ✅
**FAIL** = Found a termination condition or plateau ❌

## Adding New Tests

To add new endless verification tests:

```javascript
test('should [verify endless behavior]', async () => {
  wm.start();
  
  // Simulate conditions
  // ...
  
  // Assert endless behavior
  expect(wm.running).toBe(true);
  expect(wm.wave).toBeGreaterThan(expectedMinimum);
}, timeout);
```

## Coverage Goals
- Branches: 80%+
- Functions: 80%+
- Lines: 80%+
- Statements: 80%+
