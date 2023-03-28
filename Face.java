public class Face {

   private String [][] face;

   public Face(String color)
   {
       face = new String [3][3];
       for(int row = 0; row<3; row++){
         for(int col = 0; col<3; col++){
           face[row][col] = color;// + row + "" + col;
         }
        }
   }
   public String [][] copyFace()
   {
     String [][] temp = new String[3][3];
    for(int r = 0; r<3; r++)
    {
        for(int c = 0; c<3; c++)
        {
            temp[r][c] = face[r][c];
        }
    }
    return temp;
   }
   public void rotateFaceClock()
   {
     String temp = face[0][0];
     face[0][0] = face[2][0];
     face[2][0] = face[2][2];
     face[2][2] = face[0][2];
     face[0][2] = temp;

     String temp2 = face[0][1];
     face[0][1] = face[1][0];
     face[1][0] = face[2][1];
     face[2][1] = face[1][2];
     face[1][2] = temp2;
   }
   public void rotateFaceCountClock()
   {
    String temp = face[0][0];
    face[0][0] = face[0][2];
    face[0][2] = face[2][2];
    face[2][2] = face[2][0];
    face[2][0] = temp;

    String temp2 = face[0][1];
     face[0][1] = face[1][2];
     face[1][2] = face[2][1];
     face[2][1] = face[1][0];
     face[1][0] = temp2;
   }

        
   public String [][] getFace()
   {
       return face;
   }
   public void setFace(String [][] f)
   {
     face = f;
   }
   //returns a single row of the face, which will eventually be printed to the console
  //returns String
  public String getRow(int rowNum)
  {
    return face[rowNum][0] + " " + face[rowNum][1] + " " + face[rowNum][2] + " ";
  }
}
