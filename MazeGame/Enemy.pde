import java.util.*;
public class Enemy {
 int enemyR, enemyC;
 boolean created;
 Maze maze;
 Enemy(Maze m, int n){
   maze = m;
   while (created == false){
     int R = (int)random(n-2) + 1;
     int C = (int)random(n-2) + 1;
     if (maze.getChar(R, C) == ' '  && Math.abs(R - maze.getStart(0)) > 2 && Math.abs(C - maze.getStart(1)) > 2 ){
       enemyR = R;
       enemyC = C;
       created = true;
     }
    }
  }
  void display(){
    fill(110, 33, 176);
    rect((maze.scaleX()) * enemyC + maze.scaleX()/6 ,maze.scaleY() * enemyR + maze.scaleY()/4.75, maze.scaleX()/1.5, maze.scaleY()/1.5);
  }
}
