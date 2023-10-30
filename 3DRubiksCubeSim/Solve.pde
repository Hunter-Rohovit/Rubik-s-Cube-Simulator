import java.util.*;

public class Solve {
    private Cube cube;
    public Solve(Cube cube)
    {
        this.cube = cube;
    }
    public String [][] getFace(int idx)
    {
        return cube.getFaces().get(idx).getFace();
    }

    //using the beginner daisy method to solve the cube
    public void createDaisy()
    {
        //Next 5 If Statements moves the face with Yellow center to Position 0
        if(getFace(2)[1][1].equals("Y")){
            cube.rotateUp();
            cube.addMove("Rotate Cube Up");}
        if(getFace(1)[1][1].equals("Y")){
            cube.rotateCountClockwise();
            cube.addMove("Rotate Cube CCW");
            cube.rotateUp();
            cube.addMove("Rotate Cube Up");
        }
        if(getFace(3)[1][1].equals("Y")){
            cube.rotateClockwise();
            cube.addMove("Rotate Cube CW");
            cube.rotateUp();
            cube.addMove("Rotate Cube Up");
        }
      if(getFace(4)[1][1].equals("Y")){
            cube.rotateDown();
            cube.addMove("Rotate Cube Down");
            cube.rotateDown();
            cube.addMove("Rotate Cube Down");
        }
      if(getFace(5)[1][1].equals("Y")){
            cube.rotateDown();
            cube.addMove("Rotate Cube Down");} 

       for(int i = 0; i<4; i++)
            {
              cube.up();
                if(getFace(0)[1][2].equals("W"))
                {
                  continue;
                }
                else
                {
                    if(getFace(1)[0][1].equals("W")){
                      cube.leftP();
                      cube.upP();
                      cube.backP();
                      cube.up();                     
                    }
                    else if(getFace(1)[1][0].equals("W")){
                      cube.upP();
                      cube.backP();   
                      cube.up();  
                    }
                    else if(getFace(1)[1][2].equals("W")){
                      cube.up();
                      cube.front();
                      cube.addMove("F");
                      cube.upP();
                    }
                    else if(getFace(1)[2][1].equals("W")){
                      cube.down();
                      cube.down();
                      cube.right();
                      cube.up();
                      cube.frontP();
                      cube.addMove("F'");
                      cube.upP();
                    }
                    //Face2
                    else if(getFace(2)[0][1].equals("W")){
                      cube.front();
                      cube.addMove("F");
                      cube.right();
                    }
                    else if(getFace(2)[1][0].equals("W")){
                      cube.up();
                      cube.up();
                      cube.leftP();
                      cube.up();
                      cube.up();
                    }
                    else if(getFace(2)[1][2].equals("W")){
                      cube.right();
                    }
                    else if(getFace(2)[2][1].equals("W")){
                      cube.down();
                      cube.right();
                      cube.up();
                      cube.frontP();
                      cube.addMove("F'");
                      cube.upP();
                    }
                    //Face3
                    else if(getFace(3)[0][1].equals("W")){
                      cube.right();
                      cube.upP();
                      cube.back();
                      cube.up();
                    }
                    else if(getFace(3)[1][0].equals("W")){
                      cube.up();
                      cube.frontP();
                      cube.addMove("F'");
                      cube.upP();
                    }
                    else if(getFace(3)[1][2].equals("W")){
                      cube.upP();
                      cube.back();
                      cube.up();
                    }
                    else if(getFace(3)[2][1].equals("W")){
                      cube.rightP();
                      cube.upP();
                      cube.back();
                      cube.up();
                    }
                    //Face4
                    else if(getFace(4)[0][1].equals("W")){
                      cube.down();
                      cube.right();
                      cube.right();
                    }
                    else if(getFace(4)[1][0].equals("W")){
                      cube.down();
                      cube.down();
                      cube.right();
                      cube.right();
                    }
                    else if(getFace(4)[1][2].equals("W")){
                      cube.right();
                      cube.right();
                    }
                    else if(getFace(4)[2][1].equals("W")){
                      cube.downP();
                      cube.right();
                      cube.right();
                    }
                    //Face5
                    else if(getFace(5)[0][1].equals("W")){
                      cube.downP();
                      cube.rightP();
                      cube.upP();
                      cube.back();
                      cube.up();
                    }
                    else if(getFace(5)[1][0].equals("W")){
                      cube.up();
                      cube.up();
                      cube.left();
                      cube.up();
                      cube.up();
          
                    }
                    else if(getFace(5)[1][2].equals("W")){
                      cube.rightP();
                    }
                    else if(getFace(5)[2][1].equals("W")){
                      cube.backP();
                      cube.rightP();
                    } 
                }
                
              }
    }
    //method used for white cross method
    public boolean checkCorner(String c1, String c2)
    {
       return getFace(4)[0][2].equals("W")
           &&getFace(2)[2][2].equals(c1)
           &&getFace(3)[2][0].equals(c2);
    }
    public boolean correctTopCorner(String c1, String c2)
    {
        if(getFace(2)[0][2].equals("W") 
                ||getFace(0)[2][2].equals("W")
                ||getFace(3)[0][0].equals("W"))
                {
                    if((c1.equals(getFace(2)[0][2]) || c1.equals(getFace(0)[2][2])
                    || c1.equals(getFace(3)[0][0])) && (c2.equals(getFace(2)[0][2])
                    || c2.equals(getFace(0)[2][2]) || c2.equals(getFace(3)[0][0])))
                    {
                        return true;
                    }
                }
                return false;
    }
    public boolean correctBottomCorner(String c1, String c2)
    {
        if(getFace(2)[2][2].equals("W") 
                ||getFace(4)[0][2].equals("W")
                ||getFace(3)[2][0].equals("W"))
                {
                    if((c1.equals(getFace(2)[2][2]) || c1.equals(getFace(3)[2][0])
                    || c1.equals(getFace(4)[0][2])) && (c2.equals(getFace(2)[2][2])
                    || c2.equals(getFace(3)[2][0]) || c2.equals(getFace(4)[0][2])))
                    {
                        return true;
                    }
                }
                return false;

    }
    public void whiteCross()
    {
        //solving white edges
        for(int i = 0; i<4; i++)
        {
            String col = getFace(2)[0][1];
            while(!col.equals(getFace(2)[1][1]))
            {
                cube.up();
                cube.rotateCountClockwise();
                cube.addMove("Rotate Cube CCW");
            }
            cube.front();
            cube.front();
            cube.addMove("F");
            cube.addMove("F");
            cube.rotateClockwise();
            cube.addMove("Rotate Cube CW");

        }

        //first - check top corners
        //if found - frontMove until it is above proper position
        //use base move until its correctly positioned
        //else, do one baseMove and repeat top steps
    for(int i = 0; i<4; i++)
    {
        String c1 = getFace(2)[2][1];
        String c2 = getFace(3)[2][1];
        int count = 0;
        for(int j = 0; j<4; j++)
        {
            if(correctTopCorner(c1,c2))
            {
              while(!checkCorner(c1,c2))
              {
                cube.baseMove();
              }
              break;
            }
            else{
                count++;
                cube.up();
            }
        }
        if(count == 4)
        {
            int count2 = 0;
            for(int j = 0; j<4; j++)
            {
                if(correctBottomCorner(c1,c2))
                {
                    break;
                }
                cube.rotateCountClockwise();
                cube.addMove("Rotate Cube CCW");
                count2++;
            }
            if(count2 == 0)
            {
            while(!checkCorner(c1,c2))
              {
                cube.baseMove();
              }
            }
            else if(count2 == 1)
            {
                cube.baseMove();
                cube.upP();
                cube.rotateClockwise();
                cube.addMove("Rotate Cube CW");
                while(!checkCorner(c1,c2))
                {
                cube.baseMove();
                }

            }
            else if(count2 == 2)
            {
                cube.baseMove();
                cube.upP();
                cube.upP();
                cube.rotateClockwise();
                cube.rotateClockwise();
                cube.addMove("Rotate Cube CW");
                cube.addMove("Rotate Cube CW");
                while(!checkCorner(c1,c2))
                {
                cube.baseMove();
                }
            }
            else
            {
                cube.baseMove();
                cube.up();
                cube.rotateCountClockwise();
                cube.addMove("Rotate Cube CCW");
                while(!checkCorner(c1,c2))
                {
                cube.baseMove();
                }
            }
        }
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
    }

    cube.rotateUp();
    cube.rotateUp();
    cube.addMove("Rotate Cube Up");
    cube.addMove("Rotate Cube Up");
}
public void moveMiddleLayerRight()
{
  cube.up();
  cube.baseMove();
  cube.frontP();
  cube.addMove("F'");
  cube.upP();
  cube.front();
  cube.addMove("F");
  cube.up();
}
public void moveMiddleLayerLeft()
{
    cube.upP();
    cube.leftP();
    cube.upP();
    cube.left();
    cube.up();
    cube.front();
    cube.addMove("F");
    cube.up();
    cube.frontP();
    cube.addMove("F'");
    cube.upP(); 
}
public boolean checkMiddleEdge(String c1, String c2)
{
    if(c1.equals(getFace(2)[1][2]))
    {
        if(c2.equals(getFace(3)[1][0]))
        {
            return true;
        }
    }
    return false;
}

public void solveMiddleLayer()
{
  cube.rotateDown();
  cube.rotateDown();
  cube.addMove("Rotate Cube Down");
  cube.addMove("Rotate Cube Down");

  for(int i = 0; i<4; i++)
  {
    String c1 = getFace(2)[1][1];
    String c2 = getFace(3)[1][1];

    if(checkMiddleEdge(c1, c2))
    {
      cube.rotateClockwise();
      cube.addMove("Rotate Cube CW");
      continue;
    }
    int count = 0;
    for(int j = 0; j<4; j++){
      if(c1.equals(getFace(2)[0][1]) && c2.equals(getFace(0)[2][1])){
        moveMiddleLayerRight();
        break;
      }
      if(c1.equals(getFace(0)[2][1]) && c2.equals(getFace(2)[0][1])){
        cube.upP();
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
        moveMiddleLayerLeft();
        cube.rotateCountClockwise();
        cube.addMove("Rotate Cube CCW");
        break;
      }
      cube.up();
      count++;
    }
    
    if(count == 4)
    {
      int count2 = 0;
      for(int j = 0; j<4; j++){
        if((c1.equals(getFace(3)[1][0]) || c1.equals(getFace(2)[1][2]))
            && (c2.equals(getFace(3)[1][0]) || c2.equals(getFace(2)[1][2])))
        {
          count2 = j;
          break;
        }
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
      }
      if(count2 == 0)
      {
        moveMiddleLayerRight();
        cube.up();
        if(c1.equals(getFace(2)[0][1]) && c2.equals(getFace(0)[2][1])){
          moveMiddleLayerRight();
        }
        if(c1.equals(getFace(0)[2][1]) && c2.equals(getFace(2)[0][1])){
          cube.upP();
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          moveMiddleLayerLeft();
          cube.rotateCountClockwise();
          cube.addMove("Rotate Cube CCW");
        }

      }
      if(count2 == 1)
      {
        moveMiddleLayerRight();
        cube.up();
        cube.up();
        cube.rotateCountClockwise();
        cube.addMove("Rotate Cube CCW");
        if(c1.equals(getFace(2)[0][1]) && c2.equals(getFace(0)[2][1])){
          moveMiddleLayerRight();
        }
        if(c1.equals(getFace(0)[2][1]) && c2.equals(getFace(2)[0][1])){
          cube.upP();
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          moveMiddleLayerLeft();
          cube.rotateCountClockwise();
          cube.addMove("Rotate Cube CCW");
        }
      }
      if(count2 == 2)
      {
        moveMiddleLayerRight();
        cube.upP();
        cube.rotateClockwise();
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
        cube.addMove("Rotate Cube CW");
        if(c1.equals(getFace(2)[0][1]) && c2.equals(getFace(0)[2][1])){
          moveMiddleLayerRight();
        }
        if(c1.equals(getFace(0)[2][1]) && c2.equals(getFace(2)[0][1])){
          cube.upP();
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          moveMiddleLayerLeft();
          cube.rotateCountClockwise();
          cube.addMove("Rotate Cube CCW");
        }
      }
      if(count2 ==3)
      {
        moveMiddleLayerRight();
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
        if(c1.equals(getFace(2)[0][1]) && c2.equals(getFace(0)[2][1])){
          moveMiddleLayerRight();
        }
        if(c1.equals(getFace(0)[2][1]) && c2.equals(getFace(2)[0][1])){
          cube.upP();
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          moveMiddleLayerLeft();
          cube.rotateCountClockwise();
          cube.addMove("Rotate Cube CCW");
        }
      } 
    }
    cube.rotateClockwise();
    cube.addMove("Rotate Cube CW");
  }
    
    }
    public void yellowCross()
    {
      int count =0;
      for(int i = 0; i<4; i++)
      {
        if(getFace(0)[0][1].equals("Y") &&
          getFace(0)[1][1].equals("Y") &&
          getFace(0)[1][0].equals("Y") &&
          getFace(0)[1][2].equals("Y") &&
          getFace(0)[2][1].equals("Y"))
          {
            break;
          }
        if(getFace(0)[0][1].equals("Y") &&
          getFace(0)[1][1].equals("Y") &&
          getFace(0)[1][0].equals("Y"))
          {
            cube.front();
            cube.addMove("F");
            cube.up();
            cube.right();
            cube.upP();
            cube.rightP();
            cube.frontP();
            cube.addMove("F'");
            break;
          }
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          count++;
      }
      if(count == 4){
        int count2 = 0;
        for(int i = 0; i<2; i++)
        {
          if(getFace(0)[1][0].equals("Y") &&
          getFace(0)[1][1].equals("Y") &&
          getFace(0)[1][2].equals("Y"))
          {
            cube.front();
            cube.addMove("F");
            cube.up();
            cube.right();
            cube.upP();
            cube.rightP();
            cube.frontP();
            cube.addMove("F'");
            yellowCross();
            break;
          }
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          count2++;
        }
        if(count2==2)
        {
              cube.front();
              cube.addMove("F");
              cube.up();
              cube.right();
              cube.upP();
              cube.rightP();
              cube.frontP();
              cube.addMove("F'");
              yellowCross();
        }
      }

    }
   
    public boolean correctCorner(String c1, String c2)
    {
      if((c1.equals(getFace(0)[2][2]) || c1.equals(getFace(2)[0][2]) || c1.equals(getFace(3)[0][0])) &&
        (c2.equals(getFace(0)[2][2]) || c2.equals(getFace(2)[0][2]) || c2.equals(getFace(3)[0][0])))
        {
          return true;
        }
        return false;
    }
    public void swapCorners()
    {
      for(int i = 0; i<3; i++){
        cube.baseMove();
      }
      for(int i = 0; i<3; i++)
      {
        cube.frontP();
        cube.addMove("F'");
        cube.upP();
        cube.front();
        cube.addMove("F");
        cube.up();

      }
      cube.upP(); 
    }
    public void topFace()
    {
      cube.rotateUp();
      cube.rotateUp();
      cube.addMove("Rotate Cube Up");
      cube.addMove("Rotate Cube Up");
     for(int i = 0; i<4; i++)
      {
        if(getFace(4)[0][2].equals("Y"))
        {
          cube.down();
          continue;
        }
        while(!getFace(4)[0][2].equals("Y")){
          cube.baseMove();
        }
        cube.down();
      }
      while(!(getFace(2)[0][2].equals(getFace(2)[1][2])
       && getFace(3)[0][0].equals(getFace(3)[1][0]))){
         cube.downP();
       }
       cube.rotateUp();
       cube.rotateUp();
       cube.addMove("Rotate Cube Up");
       cube.addMove("Rotate Cube Up");
    }
    //rightP();
    //front();
    //rightP();
    //2back();
    //right();
    //frontP();
    //rightP();
    //2back();
    //2right();
    public void cornerPositionMove()
    {
      cube.rightP();
      cube.front();
      cube.addMove("F");
      cube.rightP();
      cube.back();
      cube.back();
      cube.right();
      cube.frontP();
      cube.addMove("F'");
      cube.rightP();
      cube.back();
      cube.back();
      cube.right();
      cube.right();
    }
    public void lastCorners()
    {
      ArrayList <Integer> pos = new ArrayList<Integer>();
      for(int i = 0; i<4; i++)
      {
        if(getFace(2)[0][0].equals(getFace(2)[0][2]))
        {
          pos.add(i);
        }
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
      }
      if(pos.size() == 0)
      {
        cornerPositionMove();
        lastCorners();
      }
      if(pos.size() == 1)
      {
        if(pos.get(0)==0)
        {
          cube.rotateClockwise();
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          cube.addMove("Rotate Cube CW");
        }
        if(pos.get(0) == 1)
        {
          cube.rotateCountClockwise();
          cube.addMove("Rotate Cube CCW");
        }
        if(pos.get(0) == 3)
        {
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
        }
        cornerPositionMove();
      }
      while(!getFace(2)[0][2].equals(getFace(2)[1][2]))
      {
        cube.up();
      }
     
    }
    
    public void finalMove()
    {
      cube.baseMove();
        cube.leftP();
        cube.upP();
        cube.left();
        cube.up();
      for(int i = 0; i<5; i++)
      {
        cube.baseMove();
      }
      for(int i = 0; i<5; i++)
      {
        cube.leftP();
        cube.upP();
        cube.left();
        cube.up();
      }
    }
    public boolean checkLastEdges()
    {
      for(int i = 1; i<4; i++)
      {
        if(!getFace(i)[1][1].equals(getFace(i)[0][1])){
          return false;
        }
      }
      if(!getFace(5)[1][1].equals(getFace(5)[2][1]))
      {
        return false;
      }
      return true;
    }
    public void lastStep()
    {
      ArrayList <Integer> pos = new ArrayList<Integer>();
      for(int i = 0; i<4; i++)
      {
        if(getFace(2)[0][1].equals(getFace(2)[1][1]))
        {
          pos.add(i);
        }
        cube.rotateClockwise();
        cube.addMove("Rotate Cube CW");
      }
      if(pos.size() == 0)
      {
         finalMove();
         lastStep();
      }
      if(pos.size()==1)
      {
        if(pos.get(0) == 3)
        {
          cube.rotateCountClockwise();
          cube.addMove("Rotate Cube CCW");
        }
        if(pos.get(0) == 1)
        {
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
        }
        if(pos.get(0) == 2)
        {
          cube.rotateClockwise();
          cube.rotateClockwise();
          cube.addMove("Rotate Cube CW");
          cube.addMove("Rotate Cube CW");
        }
        while(!checkLastEdges())
       {
         finalMove();
       }
      }
      
    }
}
