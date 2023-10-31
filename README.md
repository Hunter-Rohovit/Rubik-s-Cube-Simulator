# Rubiks Cube Solver & Simulator
Here is my Rubik's Cube Solver and Simulator! This is a project that started for me back in the summer of 2021 for a Programming in Java Class at UC Berkely's ATDP. Our final was to simulate a rubik's cube with an array list of 2D arrays. However, having learned how to solve a rubik's cube that summer and watching a video online of an MIT robot solving a rubik's cube in 0.38 seconds, I was inspired to develop my own program that could solve a rubik's cube using the beginner's method which I know. The basics of this project is a Rubik's Cube Simulator that can move a Rubik's Cube in a 3D & 2D Space, mix a cube randomly, set the cube's face colors, store the moves needed to solve the cube in an array, print out all the moves and the number of moves required to solve. This project culminated in over a year's worth of work, mostly on the solving algorithm, but I finally managed to get it to work! The original code shows the original simulation of the Rubik's Cube as sort of the "Net" of a cube where each letter represents a color. The 3D simulation gives a better visualization of what the solving algorithm is actually doing and is why I decided to implement it into my code using Processing. 

## 3D Visualization
![3DRubiksCube](https://github.com/Hunter-Rohovit/Rubik-s-Cube-Simulator/assets/105554281/d1e9562a-e22d-4be7-a98c-f0ecc1959036)

## 2D Visualization
![2DSimulation](https://github.com/Hunter-Rohovit/Rubik-s-Cube-Simulator/assets/105554281/e374ed21-0d6f-4811-bd73-dce20056fcb8)

## Future Goals
Now that I have an algorithm which can state the moves required to solve a rubik's cube and code to manually set the face colors on the cube, I want to implement automatic scanning and color detection of a physical cube. Essentially, a user would put a physical rubik's cube in frame and rotate it while a camera is scanning colors and automatically initializing the cube with colors from my original code. ****Update:**** After spending a summer working with computer vision, I'm beginning the development of a color detection algorithm.
