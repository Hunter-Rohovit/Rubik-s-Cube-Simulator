public class Face2D {

   private String [][] face;

   //Initializes the 3x3 array with a single color -> used for each face
   public Face2D(String c)
   {
       face = new String [3][3];
       for(int row = 0; row<3; row++){
         for(int col = 0; col<3; col++){
           face[row][col] = c;// + row + "" + col;
         }
        }
   }
   //method to return the same 3x3 array to avoid 
   //copied values while manipulating the cube
   
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
   //Method to rotate the squares on the face clockwise
   /* Ex: 123     741
          456  -> 852
          789     963
    */
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
   //Method to rotate the squares on the face counter clockwise
   /* Ex: 123     369
          456  -> 258
          789     147
    */
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

   //getMethod     
   public String [][] getFace()
   {
       return face;
   }
   //setMethod
   public void setFace(int x, int y, String col)
   {
     face[x][y] = col;
   }
   //returns a single row of the face, which will eventually be printed to the console
  //returns String
  public String getRow(int rowNum)
  {
    return face[rowNum][0] + " " + face[rowNum][1] + " " + face[rowNum][2] + " ";
  }
}
