// Credit to Daniel Shiffman for the code to represent a rubiks cube in a 3d space
//The code for camera and position setup, visualization, and 3D matrix maneuvering are his
//His lines of code: 
//Class Rubik's Cube: Lines: 17-83, 145-162
//Class Cubie: All
//Class Face: All
// Daniel Shiffman
// https://thecodingtrain.com/CodingChallenges/142.2-rubiks-cube.html

//My code:
//Representing the cube as an arraylist of 2D arrays
//16 different moves in a 3D space (using Shiffman's turnXYZ methods)
//Logic to solve rubik's cube (using beginner's method)
//Method to manually input colors of faces
//Printing the moves needed to solve rubiks cube




import peasy.*;
import java.util.*;

PeasyCam cam;
int counter = 0;
int dim = 3;
Cubie[] cube1 = new Cubie[dim*dim*dim];
ArrayList<String> moves = new ArrayList<String>();
boolean started = false;
Cube cube2D = new Cube();

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube1[index] = new Cubie(matrix, x, y, z);
        index++;
      }
    }
  }
  println(cube2D);
  cube2D.mixCube();
  println(cube2D);
  Solve one = new Solve(cube2D);
  one.createDaisy();
  
  print(cube2D);
  one.whiteCross();
   one.solveMiddleLayer();
   one.yellowCross(); 
   one.topFace();
   one.lastCorners();
   one.lastStep();
   System.out.println(cube2D);
  for(int m = 0; m<cube2D.getMoves().size(); m++){
    moves.add(cube2D.getMoves().get(m));}
   int count = 0;
        for(int i = 100; i<cube2D.getMoves().size(); i++){
            if(cube2D.getMoves().get(i).length()<2){
                count++;
            }
            System.out.println(cube2D.getMoves().get(i));
        }
        System.out.println("Total moves required: " + count);
}

void turnZ(int index, int dir) {
  for (int i = 0; i < cube1.length; i++) {
    Cubie qb = cube1[i];
    if (qb.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.y);
      qb.update(round(matrix.m02), round(matrix.m12), round(qb.z));
      qb.turnFacesZ(dir);
    }
  }
}

void turnY(int index, int dir) {
  for (int i = 0; i < cube1.length; i++) {
    Cubie qb = cube1[i];
    if (qb.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.x, qb.z);
      qb.update(round(matrix.m02), qb.y, round(matrix.m12));
      qb.turnFacesY(dir);
    }
  }
}

void turnX(int index, int dir) {
  for (int i = 0; i < cube1.length; i++) {
    Cubie qb = cube1[i];
    if (qb.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(qb.y, qb.z);
      qb.update(qb.x, round(matrix.m02), round(matrix.m12));
      qb.turnFacesX(dir);
    }
  }
}

//The next 16 methods are ones I implemented using the provided turnXYZ() methods
void front(){
  turnZ(1, 1);
}
void frontP(){
  turnZ(1, -1);
}
void back(){
  turnZ(-1, -1);
}
void backP(){
  turnZ(-1, 1);
}
void up(){
  turnY(-1, 1);
}
void upP(){
  turnY(-1, -1);
}
void down(){
  turnY(1, -1);
}
void downP(){
  turnY(1, 1);
}
void left(){
  turnX(-1, -1);
} 
void leftP(){
  turnX(-1, 1);
}
void right(){
  turnX(1, 1);
}
void rightP(){
  turnX(1, -1);
}

void rotateCounterClockwise(){
  for (int i = -1; i<2; i++){
    turnY(i,-1);
  }
}
void rotateClockwise(){
  for (int i = -1; i<2; i++){
    turnY(i,1);
  }
}
void rotateUp(){
  for (int i = -1; i<2; i++){
    turnX(i,1);
  }
}
void rotateDown(){
  for (int i = -1; i<2; i++){
    turnX(i,-1);
  }
}
void addMoves(String move){
  moves.add(move);}






void draw() {
 background(51);
  if(frameCount % 1 == 0 && started == true && counter<100){
    String move = moves.get(counter);
    doMove(move);
    counter++;
  }
  if(frameCount % 5 == 0 && started == true && counter<moves.size()){
    String move = moves.get(counter);
    doMove(move);
    counter++;
  }
  
  scale(50);
  for (int i = 0; i < cube1.length; i++) {
    cube1[i].show(); 
  }
}
