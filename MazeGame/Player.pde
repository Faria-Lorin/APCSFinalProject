import java.util.*;
public class Player {
  float playerXcor, playerYcor;
  Maze maze;
  Player(Maze m /*, ArrayList<Enemy*/){
    maze = m;
    float[] start = maze.getStart();
    playerXcor = start[0];
    playerYcor = start[1];
  }
  
  void display(){
    fill(255,0,0);
    rect((maze.scaleX()) * playerXcor + maze.scaleX()/4 ,maze.scaleY() * playerYcor + maze.scaleY()/4, maze.scaleX()/2, maze.scaleY()/2);
  }
  
}
