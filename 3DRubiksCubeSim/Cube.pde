import java.util.*;
public class Cube {
  private ArrayList<Face2D> faces;
  private ArrayList<String> moves= new ArrayList<String>();
  //Initializing the cube
  //The cube's composition is an arraylist of size 6
  //Each item in the list is a 3x3 2D array, represnting the colors of the face
  //When first creating the cube, we set all faces to a single color
  public Cube()
  {
    faces = new ArrayList<Face2D>();
    faces.add(new Face2D("G"));
    faces.add(new Face2D("R"));
    faces.add(new Face2D("W"));
    faces.add(new Face2D("O"));
    faces.add(new Face2D("B"));
    faces.add(new Face2D("Y"));
  }
  //getMethod
  public ArrayList <Face2D> getFaces()
  {
    return faces;
  }
  public ArrayList <String> getMoves() {
    return moves;
  }
  public void addMove(String move) {
    moves.add(move);
  }
  public void setCube(int faceNum, int x, int y, String col)
  {
    faces.get(faceNum).setFace(x, y, col);
  }
  //Method to randomly scramble the cube
  public void mixCube()
  {
    for (int i = 0; i<100; i++)
    {

      int random = (int)(Math.random()*16)+1;
      switch (random) {
      case 1:
        rotateClockwise();
        moves.add("Rotate Cube CW");
        break;
      case 2:
        rotateCountClockwise();
        moves.add("Rotate Cube CCW");
        break;
      case 3:
        rotateUp();
        moves.add("Rotate Cube Up");
        break;
      case 4: 
        rotateDown();
        moves.add("Rotate Cube Down");
        break;
      case 5:
        front();
        moves.add("F");
        break;
      case 6:
        frontP();
        moves.add("F'");
        break;
      case 7:
        up();
        break;
      case 8:
        upP();
        break;
      case 9:
        down();
        break;
      case 10:
        downP();
        break;
      case 11:
        right();
        break;
      case 12:
        rightP();
        break;
      case 13:
        left();
        break;
      case 14:
        leftP();
        break;
      case 15:
        back();
        break;
      case 16:
        backP();
        break;
      }
    }
  }
  //Method turns the entire cube 90 degrees clockwise
  public void rotateClockwise()
  {
    faces.get(0).rotateFaceClock();
    faces.get(4).rotateFaceCountClock();

    Face2D temp = faces.get(1);

    faces.set(1, faces.get(2));
    faces.set(2, faces.get(3));

    faces.get(5).rotateFaceClock();
    faces.get(5).rotateFaceClock();
    temp.rotateFaceClock();
    temp.rotateFaceClock();

    faces.set(3, faces.get(5));
    faces.set(5, temp);
  }
  //Method turns the entire cube 90 degrees counter clockwise
  public void rotateCountClockwise()
  {
    faces.get(0).rotateFaceCountClock();
    faces.get(4).rotateFaceClock();

    Face2D temp = faces.get(3);

    faces.set(3, faces.get(2));
    faces.set(2, faces.get(1));

    faces.get(5).rotateFaceClock();
    faces.get(5).rotateFaceClock();
    temp.rotateFaceClock();
    temp.rotateFaceClock();

    faces.set(1, faces.get(5));
    faces.set(5, temp);
  }
  //method turns the entire cube up so that the bottom face is now facing forward
  //and the top face now facing backwords
  public void rotateUp()
  {
    Face2D temp = faces.get(5);
    faces.set(5, faces.get(0));
    faces.set(0, faces.get(2));
    faces.set(2, faces.get(4));
    faces.set(4, temp);
    faces.get(1).rotateFaceCountClock();
    faces.get(3).rotateFaceClock();
  }

  //method is opposite to rotateUp, turns the entire cube so that the top face is now facing forward
  //and the bottom face is now facing backwards
  public void rotateDown()
  {
    Face2D temp = faces.get(0);
    faces.set(0, faces.get(5));
    faces.set(5, faces.get(4));
    faces.set(4, faces.get(2));
    faces.set(2, temp);
    faces.get(1).rotateFaceClock();
    faces.get(3).rotateFaceCountClock();
  }

  //method for standard Rubik's Cube notation: Front Turn
  public void front()
  {
    faces.get(2).rotateFaceClock();

    String [][] temp = faces.get(0).copyFace();
    for (int i = 0; i<3; i++)
    {
      faces.get(0).getFace()[2][i] = faces.get(1).getFace()[2-i][2];
      faces.get(1).getFace()[2-i][2] = faces.get(4).getFace()[0][2-i];
      faces.get(4).getFace()[0][2-i] = faces.get(3).getFace()[i][0];
      faces.get(3).getFace()[i][0] = temp[2][i];
    }
  }
  //method for standard Rubik's Cube notation: Front Prime Turn
  public void frontP()
  {
    faces.get(2).rotateFaceCountClock();

    String [][] temp = faces.get(0).copyFace();
    for (int i = 0; i<3; i++)
    {
      faces.get(0).getFace()[2][i] = faces.get(3).getFace()[i][0];
      faces.get(3).getFace()[i][0] = faces.get(4).getFace()[0][2-i];
      faces.get(4).getFace()[0][2-i] = faces.get(1).getFace()[2-i][2];
      faces.get(1).getFace()[2-i][2] = temp[2][i];
    }
  }
  //method for standard Rubik's Cube notation: Back Turn
  public void back()
  {
    rotateClockwise();
    rotateClockwise();
    front();
    rotateClockwise();
    rotateClockwise();
    moves.add("B");
  }
  //method for standard Rubik's Cube notation: Back Prime Turn
  public void backP()
  {
    rotateClockwise();
    rotateClockwise();
    frontP();
    rotateClockwise();
    rotateClockwise();
    moves.add("B'");
  }
  //method for standard Rubik's Cube notation: Right Turn
  public void right()
  {
    rotateClockwise();
    front();
    rotateCountClockwise();
    moves.add("R");
  }
  //method for standard Rubik's Cube notation: Right Prime Turn
  public void rightP()
  {
    rotateClockwise();
    frontP();
    rotateCountClockwise();
    moves.add("R'");
  }
  //method for standard Rubik's Cube notation: Left Turn
  public void left()
  {
    rotateCountClockwise();
    front();
    rotateClockwise();
    moves.add("L");
  }
  //method for standard Rubik's Cube notation: Left Prime Turn
  public void leftP()
  {
    rotateCountClockwise();
    frontP();
    rotateClockwise();
    moves.add("L'");
  }
  //method for standard Rubik's Cube notation: Up Turn
  public void up()
  {
    rotateDown();
    front();
    rotateUp();
    moves.add("U");
  }
  //method for standard Rubik's Cube notation: Up Prime Turn
  public void upP()
  {
    rotateDown();
    frontP();
    rotateUp();
    moves.add("U'");
  }
  //method for standard Rubik's Cube notation: Down Turn
  public void down()
  {
    rotateUp();
    front();
    rotateDown();
    moves.add("D");
  }
  //method for standard Rubik's Cube notation: Down Prime Turn
  public void downP()
  {
    rotateUp();
    frontP();
    rotateDown();
    moves.add("D'");
  }
  //method for a move commonly used move throughout solving process
  public void baseMove()
  {
    right();
    up();
    rightP();
    upP();
  }
  //REALLY long string method to return a string to the terminal showing the net of the cube and its color values
  public String toString()
  {
    return "      " + faces.get(0).getRow(0) + "\n      " + faces.get(0).getRow(1) + "\n      " + faces.get(0).getRow(2) + "\n"
      + faces.get(1).getRow(0) + faces.get(2).getRow(0) + faces.get(3).getRow(0) + "\n"
      + faces.get(1).getRow(1) + faces.get(2).getRow(1) + faces.get(3).getRow(1) + "\n"
      + faces.get(1).getRow(2) + faces.get(2).getRow(2) + faces.get(3).getRow(2) + "\n"
      + "      " + faces.get(4).getRow(0) + "\n      " + faces.get(4).getRow(1) + "\n      " + faces.get(4).getRow(2) + " \n"
      + "      " + faces.get(5).getRow(0) + "\n      " + faces.get(5).getRow(1) + "\n      " + faces.get(5).getRow(2) + " \n";
  }
}
