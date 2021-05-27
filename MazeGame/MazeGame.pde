import java.util.*;
Maze maze;
Player player;
boolean end;

void setup() {
  size(600, 600);
  background(255);
  char[][] m=new char[10][10];
  for (int i=0; i<m.length; i++) {
    for (int j=0; j<m[0].length; j++) {
      m[i][j]='#';
    }
  }
  maze = new Maze(m);
  player = new Player(maze);
  //println(maze);
}
void draw(){
  end();
  if (end==false){
    maze.display();
    player.move();
    player.display();
  }
}

void end(){
  if (player.getLives()==0){
    println("No More Lives--Game Over");
    end=true;
  }
  else if (player.getR()==maze.getEnd()[0] && player.getC()==maze.getEnd()[1]){
    println("You Win! Great Job!");
    end=true;
  }
}
