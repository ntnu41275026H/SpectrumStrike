# Spectrum Strike

**Spectrum Strike** is a high-speed action-puzzle shooter developed in **Processing**. It redefines the classic "Invader" formula by introducing a targeting matching system based on **RGB colors** and **Geometric shapes**.

---

## 🎯 Concept
In a digital battlefield, survival depends on your ability to synchronize. To eliminate an enemy, you must match your weapon’s configuration to the target type. It is a test of cognitive speed, rhythmic precision, and tactical switching.

---

## 🌟 Key Features
- **Target-Match System**: Cycle through specific targeting types designed to counter different invaders, changing your weapon's color and shape.
- **Auto-Fire & Cooldown**: Your ship fires automatically. Manage your fire rate with strategic tactical decisions.
- **Power-Up System**: Destroy special invaders to drop and trigger unique power-ups (Speed boosts, Multi-shot, etc.).
- **Shield Protection**: Use destructible pixel-grid shields to block enemy projectiles.
- **High Scores System**: Track and save your records locally with your initials.

---

## 📜 Rules & Gameplay
- **Starting Lives**: You begin the game with **3 Lives**.
- **Victory Condition**: Clear all space invaders on the screen to advance to the next level.
- **Defeat**: If you get shot by an enemy projectile or an invader reaches the bottom hit area, you lose a life. When your lives reach zero, it is Game Over.

### 🎮 Controls
- **`LEFT` / `RIGHT` Arrow Keys**: Move your ship left and right.
- **`A` Key**: Switch to Target Type 1 (Pink Triangle - Effective against Invader 1).
- **`S` Key**: Switch to Target Type 2 (Cyan Circle - Effective against Invader 2).
- **`D` Key**: Switch to Target Type 3 (Green Square - Effective against Invader 3).
- **`P` Key**: Pause / Unpause the game.
- **`UP` / `DOWN` Arrow Keys (Menu)**: Navigate through the main menu selections.
- **`Enter` Key (Menu)**: Confirm selection.

---

## 🕹️ Game Screens
- **Main Menu**: Start a new game, view instructions, or check high scores.
- **How to Play Screen**: View basic instructions and controller configurations.
- **In-Game (Playing Mode)**: Fight waves of descending invaders with automated firing mechanisms.
- **Level Transition / Game Setup Screen**: Flashes the level number before starting or resetting after a life loss.
- **High Scores Menu**: Enter your 3-character initials using keyboard inputs to save your score.

---

## 💻 Technical Implementation
- **Processing (Java)**: Built with Processing standard framework using 2D rendering at a stable frame rate.
- **Minim Audio Library**: Fully integrated audio processing for context-aware background voices and dynamic game sound effects.
- **Object-Oriented Architecture**: Modular design tracking state machines for the Player, Projectiles, Power-Ups, and 3 distinct Invader categories.
- **Data Persistence**: Local high scores stored and loaded dynamically from external text files (`InvadersHighScores.txt` and `InvadersHighScoreHolders.txt`).

---

## 🚀 How to Run
1. Download and install [Processing IDE](https://processing.org/).
2. Clone this repository or copy the source files into a folder named `SpectrumStrike`.
3. Open `SpectrumStrike.pde` in Processing and click **Run**.
