import java.util.*;
public class Enemy {
 int EnemyR, EnemyC;
 Maze maze;
 Enemy(Maze m, int n){
   maze = m;
   int R = (int)random(n-2) + 1;
   int C = (int)random(n-2) + 1;
   if (maze.getChar(R, C) == ' '){
     EnemyR = R;
     EnemyC = C;
   }
  }
}
