void keyPressed(){
  if(key == ' '){
    started = true;}
   applyMove(key);
}

void applyMove(char move) {
  switch (move) {
  case 'f': 
    front();
    break;
  case 'F': 
    frontP();
    break;  
  case 'b': 
    back();
    break;
  case 'B': 
    backP();
    break;
  case 'u': 
    up();
    break;
  case 'U': 
    upP();
    break;
  case 'd': 
    down();
    break;
  case 'D': 
    downP();
    break;
  case 'l': 
    left();
    break;
  case 'L': 
    leftP();
    break;
  case 'r': 
    right();
    break;
  case 'R': 
    rightP();
    break;
//rotateCounterClockwise
  case '1': 
    rotateCounterClockwise();
    break;
//rotateClockwise
  case '2': 
    rotateClockwise();
    break;
//rotateUp
  case '3': 
    rotateUp();
    break;
//rotateDown
  case '4': 
    rotateDown();
    break;
  }}
  void doMove(String move){
          switch (move) {
          case "F": 
            front();
            break;
          case "F'": 
            frontP();
            break;  
          case "B": 
            back();
            break;
          case "B'": 
            backP();
            break;
          case "U": 
            up();
            break;
          case "U'": 
            upP();
            break;
          case "D": 
            down();
            break;
          case "D'": 
            downP();
            break;
          case "L": 
            left();
            break;
          case "L'": 
            leftP();
            break;
          case "R": 
            right();
            break;
          case "R'": 
            rightP();
            break;
          case "Rotate Cube CCW": 
            rotateCounterClockwise();
            break;
          case "Rotate Cube CW": 
            rotateClockwise();
            break;
          case "Rotate Cube Up": 
            rotateUp();
            break;
          case "Rotate Cube Down": 
            rotateDown();
            break;
          }
}
