import java.util.*;
public class Player {
  float playerXcor, playerYcor;
  Maze maze;
  Player(Maze m /*, ArrayList<Enemy*/){
    maze = m;
    float[] start = maze.getStartCor();
    playerXcor = start[0];
    playerYcor = start[1];
  }
  
}
