import java.util.*;
Maze maze;
Player player;

void setup() {
  size(600, 600);
  background(255);
  char[][] m=new char[30][30];
  for (int i=0; i<m.length; i++) {
    for (int j=0; j<m[0].length; j++) {
      m[i][j]='#';
    }
  }
  maze = new Maze(m);
  player = new Player(maze);
  maze.display();
  println(Arrays.deepToString(m));
}
void draw(){
  player.display();
}
