import java.util.*;
public class Player {
  int playerR, playerC;
  int lives;
  color c;
  Maze maze;
  Player(Maze m /*, ArrayList<Enemy*/){
    maze = m;
    int[] start = maze.getStart();
    playerR = start[0];
    playerC = start[1];
    lives = 3;
    c=color(random(255),random(255),random(255));
  }
  
  void display(){
    fill(c);
    rect((maze.scaleX()) * playerC + maze.scaleX()/4 ,maze.scaleY() * playerR + maze.scaleY()/4, maze.scaleX()/2, maze.scaleY()/2);
  }
  
  void move(){
    if (keyPressed == true && keyCode == UP){
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
  
  int getR(){
    return playerR;
  }
  
  int getC(){
    return playerC;
  }
  
  int getLives(){
    return lives;
  }
  
}
