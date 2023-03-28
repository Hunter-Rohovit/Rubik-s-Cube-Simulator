public class Main {
    public static void main(String[] args){
        Cube cube = new Cube();
        System.out.print(cube);
        System.out.println();
        cube.mixCube();
        System.out.println(cube);
        System.out.println();
        Solve one = new Solve(cube);
        one.createDaisy();
        one.whiteCross();
        System.out.println(cube);
        one.solveMiddleLayer();
        System.out.println(cube);
        one.yellowCross();  
        System.out.println(cube);
       one.topFace();
        System.out.println(cube);
        one.lastCorners();
        System.out.println(cube);
        one.lastStep();
        System.out.println(cube);
       

    }
}
