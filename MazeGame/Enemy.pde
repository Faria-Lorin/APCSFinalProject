import java.util.*;
public class Enemy {
  int enemyR, enemyC, enemySpeed;
  boolean created, moved, dead;
  int[] directions = new int[]{0, 1, 2, 3};
  Maze maze;
  
  //constructor - creates enemy at random coordinates in maze after checking if coordinates are valid (isn't a wall)
  Enemy(Maze m, int size) {
    maze = m;
    while (created == false) {
      int R = (int)random(size-2) + 1;
      int C = (int)random(size-2) + 1;
      if (maze.getChar(R, C) == ' '  && Math.abs(R - maze.getStart(0)) > 2 && Math.abs(C - maze.getStart(1)) > 2 ) {
        enemyR = R;
        enemyC = C;
        created = true;
      }
    }
  }
  
  //display - displays enemy if it's alive;
  void display() {
    if (!dead){
      stroke(128, 0, 255);
      strokeWeight(4);
      fill(110, 33, 176, 100);
      float Xcor = maze.scaleX() * enemyC + maze.scaleX()/6;
      float Ycor = maze.scaleY() * enemyR + maze.scaleY()/4.75;
      rect(Xcor, Ycor, maze.scaleX()/1.5, maze.scaleY()/1.5);
      //eyes
      stroke(0);
      strokeWeight(1);
      fill(255, 234, 34);
      arc(Xcor + maze.scaleX()/6, Ycor + maze.scaleY()/4 , maze.scaleX()/6 , maze.scaleX()/6, 0, PI+QUARTER_PI, CHORD);
      arc(Xcor + maze.scaleX()/2, Ycor + maze.scaleY()/4  , maze.scaleX()/6 , maze.scaleX()/6, 0, PI, CHORD);
      //mouth
      fill(0);
      line(Xcor + maze.scaleX()/2.5, Ycor + maze.scaleY()/2, Xcor + maze.scaleX()/3.5, Ycor + maze.scaleY()/2);
      
      if (moved == true) moved = false;
    }
  }
  
  //move - enemy moves in random directions through the maze;
  void move() {
    if (enemySpeed == 20) {
      while (moved == false) {
        int n = (int)random(4);
        n = directions[n];
        if (n == 0) {
          if (maze.getChar(enemyR - 1, enemyC) != '#') {
            enemyR -= 1;
          }
        } else if (n == 1) {
          if (maze.getChar(enemyR + 1, enemyC) != '#') {
            enemyR += 1 ;
          }
        } else if (n == 2) {
          if (maze.getChar(enemyR, enemyC - 1) != '#') {
            enemyC -= 1;
          }
        } else if (n == 3) {
          if (maze.getChar(enemyR, enemyC + 1) != '#') {
            enemyC += 1;
          }
        }
        moved = true;
      }
      enemySpeed = 0;
    } else enemySpeed++;
  }
  
  //die - sets boolean dead to true if enemy is killed.
  void die(int r, int c){
    if (!dead){
      if ( c == enemyC && r == enemyR){
        moved = true;
        dead = true;
      }
    }
  }
  
  boolean isDead(){
    return dead;
  }
  
  //get methods
  int getR() {
    return enemyR;
  }

  int getC() {
    return enemyC;
  }
}
