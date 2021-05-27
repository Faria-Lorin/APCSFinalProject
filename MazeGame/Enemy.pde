import java.util.*;
public class Enemy {
 int EnemyR, EnemyC;
 boolean created;
 Maze maze;
 Enemy(Maze m, int n){
   maze = m;
   while (created == false){
     int R = (int)random(n-2) + 1;
     int C = (int)random(n-2) + 1;
     if (maze.getChar(R, C) == ' '  && Math.abs(R - maze.getStart(0)) > 2 && Math.abs(C - maze.getStart(1)) > 2 ){
       EnemyR = R;
       EnemyC = C;
       created = true;
     }
    }
  }
}
