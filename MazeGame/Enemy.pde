import java.util.*;
public class Enemy {
  int enemyR, enemyC, t;
  boolean created, moved, dead;
  int[] directions = new int[]{0, 1, 2, 3};
  Maze maze;
  Enemy(Maze m, int n) {
    maze = m;
    while (created == false) {
      int R = (int)random(n-2) + 1;
      int C = (int)random(n-2) + 1;
      if (maze.getChar(R, C) == ' '  && Math.abs(R - maze.getStart(0)) > 2 && Math.abs(C - maze.getStart(1)) > 2 ) {
        enemyR = R;
        enemyC = C;
        created = true;
      }
    }
  }
  
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
  void move() {
    if (t == 20) {
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
      t = 0;
    } else t++;
  }
  
  void die(int r, int c){
    if (!dead){
      if ( c == enemyC && r == enemyR){
        moved = true;
        dead = true;
      }
    }
  }
  int getR() {
    return enemyR;
  }

  int getC() {
    return enemyC;
  }
  
  boolean isDead(){
    return dead;
  }
}
