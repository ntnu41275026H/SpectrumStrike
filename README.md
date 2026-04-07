# Spectrum Strike: Shape & Shade Invaders

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Processing](https://img.shields.io/badge/Made%20with-Processing-006699.svg)

**Spectrum Strike** is a high-speed action-puzzle shooter developed in **Processing**. It redefines the classic "Invader" formula by introducing a dual-matching system based on the **HSB color model** and **Geometric shapes**.

## 🎮 Concept
In a digital battlefield, survival depends on your ability to synchronize. To eliminate an enemy, you must match both your weapon’s **Hue (Color)** and its **Geometric Form (Shape)**. It is a test of cognitive speed, rhythmic precision, and tactical switching.

## 🚀 Key Features
- **Dual-Match System**: Cycle through colors (Red, Green, Blue) and shapes (Circle, Square, Triangle).
- **Dynamic Difficulty**: 3 distinct stages with increasing speed, complex color shifting, and unpredictable patterns.
- **Neon Aesthetic**: High-contrast, minimalist visuals with glowing particle effects.
- **Overdrive Mode**: A hidden "Ultimate" difficulty unlocked only by true masters of the spectrum.

## 🛠 Rules & Gameplay
- **Starting HP**: You begin with a full health bar.
- **Victory Condition**: Successfully clear all **3 Stages** before your health reaches zero.
- **Defeat**: If your HP hits zero, it's Game Over.
- **Controls**:
  - `Space`: Cycle through Colors (Hue).
  - `Mouse Click`: Cycle through Shapes (Geometry).
  - `Mouse Movement`: Control the ship's position.

## 📈 Level Breakdown
| Level | Name | Challenge |
| :--- | :--- | :--- |
| **Level 1** | Training Grounds | Slow-moving rows; learn the basic color/shape rules. |
| **Level 2** | The Hue Shift | Increased speed and introduction of secondary colors. |
| **Level 3** | Absolute Chaos | Random formations and real-time HSB shifting. |

## 💻 Technical Implementation
- **Processing (Java)**: Utilizing the core drawing engine for 60FPS neon rendering.
- **HSB Color Model**: Implemented `colorMode(HSB)` for smooth, algorithmic color transitions.
- **Object-Oriented Programming**: Each invader is an instance of a class, managing its own state, color, and geometry.

## 📦 How to Run
1. Download and install [Processing](https://processing.org/).
2. Clone this repository:
   ```bash
   git clone [https://github.com/YourUsername/Spectrum-Strike.git](https://github.com/YourUsername/Spectrum-Strike.git)
