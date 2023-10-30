import java.util.*;
public class Cube {
   private ArrayList<Face> faces;

   public Cube()
   {
       faces = new ArrayList<Face>();
       faces.add(new Face("O"));
       faces.add(new Face("Y"));
       faces.add(new Face("G"));
       faces.add(new Face("W"));
       faces.add(new Face("R"));
       faces.add(new Face("B"));    
   }
   public ArrayList <Face> getFaces()
   {
       return faces;
   }
   public void mixCube()
   {
    for(int i = 0; i<1000; i++)
    {
        int random = (int)(Math.random()*6);
        if(random == 0)
        rotateClockwise();
       else if(random == 1)
        rotateCountClockwise();
       else if(random == 2)
        rotateUp();
       else if(random == 3)
        rotateDown();
       else if(random == 4)
        front();
       else 
        frontP();
    }
   }
   public void rotateClockwise()
   {
       faces.get(0).rotateFaceClock();
       faces.get(4).rotateFaceCountClock();

       Face temp = faces.get(1);

       faces.set(1, faces.get(2));
       faces.set(2, faces.get(3));
    
       faces.get(5).rotateFaceClock();
       faces.get(5).rotateFaceClock();
       temp.rotateFaceClock();
       temp.rotateFaceClock();

       faces.set(3, faces.get(5));
       faces.set(5, temp);

   }
   public void rotateCountClockwise()
   {
       faces.get(0).rotateFaceCountClock();
       faces.get(4).rotateFaceClock();

       Face temp = faces.get(3);

       faces.set(3, faces.get(2));
       faces.set(2, faces.get(1));

       faces.get(5).rotateFaceClock();
       faces.get(5).rotateFaceClock();
       temp.rotateFaceClock();
       temp.rotateFaceClock();

       faces.set(1, faces.get(5));
       faces.set(5, temp);
   }
   public void rotateUp()
   {
       Face temp = faces.get(5);
        faces.set(5, faces.get(0));
        faces.set(0, faces.get(2));
        faces.set(2, faces.get(4));
        faces.set(4, temp);
        faces.get(1).rotateFaceCountClock();
        faces.get(3).rotateFaceClock();
   }
   public void rotateDown()
   {
    Face temp = faces.get(0);
    faces.set(0,faces.get(5));
    faces.set(5, faces.get(4));
    faces.set(4, faces.get(2));
    faces.set(2, temp);
    faces.get(1).rotateFaceClock();
    faces.get(3).rotateFaceCountClock();
   }

   public void front()
   {
    faces.get(2).rotateFaceClock();

    String [][] temp = faces.get(0).copyFace();
    for(int i = 0; i<3; i++)
    {
        faces.get(0).getFace()[2][i] = faces.get(1).getFace()[2-i][2];
        faces.get(1).getFace()[2-i][2] = faces.get(4).getFace()[0][2-i];
        faces.get(4).getFace()[0][2-i] = faces.get(3).getFace()[i][0];
        faces.get(3).getFace()[i][0] = temp[2][i];
    }
   }
   public void frontP()
   {
    faces.get(2).rotateFaceCountClock();

    String [][] temp = faces.get(0).copyFace();
    for(int i = 0; i<3; i++)
    {
        faces.get(0).getFace()[2][i] = faces.get(3).getFace()[i][0];
        faces.get(3).getFace()[i][0] = faces.get(4).getFace()[0][2-i];
        faces.get(4).getFace()[0][2-i] = faces.get(1).getFace()[2-i][2];
        faces.get(1).getFace()[2-i][2] = temp[2][i];
    }
   }

   public void back()
   {
    rotateClockwise();
    rotateClockwise();
    front();
    rotateClockwise();
    rotateClockwise();
   }
   public void backP()
   {
    rotateClockwise();
    rotateClockwise();
    frontP();
    rotateClockwise();
    rotateClockwise();
   }
   public void right()
   {
    rotateClockwise();
    front();
    rotateCountClockwise();
   }
   public void rightP()
   {
    rotateClockwise();
    frontP();
    rotateCountClockwise(); 
   }
   public void left()
   {
    rotateCountClockwise(); 
    front();
    rotateClockwise();
   }
   public void leftP()
   {
    rotateCountClockwise(); 
    frontP();
    rotateClockwise(); 
   }
   public void up()
   {
    rotateDown();
    front();
    rotateUp();
   }
   public void upP()
   {
    rotateDown();
    frontP();
    rotateUp();
   }
   public void down()
   {
    rotateUp();
    front();
    rotateDown();
   }
   public void downP()
   {
    rotateUp();
    frontP();
    rotateDown();
   }
   public void baseMove()
   {
      right();
      up();
      rightP();
      upP(); 
   }
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
