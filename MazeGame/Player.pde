import java.util.*;
public class Player {
  int playerR, playerC;
  Maze maze;
  Player(Maze m /*, ArrayList<Enemy*/){
    maze = m;
    int[] start = maze.getStart();
    playerR = start[0];
    playerC = start[1];
    println(playerR);
    println(playerC);
    println(maze.getChar(playerR, playerC));
  }
  
  void display(){
    fill(random(255),random(255),random(255));
    rect((maze.scaleX()) * playerC + maze.scaleX()/4 ,maze.scaleY() * playerR + maze.scaleY()/4, maze.scaleX()/2, maze.scaleY()/2);
  }
  
  void move(){
    //println(maze.getChar(playerX, playerY));
    //println(maze.getChar(playerX + 1, playerY));
    if (keyPressed == true && keyCode == UP ){
      if (maze.getChar(playerR - 1, playerC) != '#')
        playerR--;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == DOWN){
      if (maze.getChar(playerR + 1 , playerC) != '#')
        playerR++;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == LEFT){
      if (maze.getChar(playerR, playerC - 1) != '#')
        playerC--;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == RIGHT){
      if (maze.getChar(playerR, playerC + 1) != '#')
        playerC++;
      keyPressed = false;
    }
  }
  
}
