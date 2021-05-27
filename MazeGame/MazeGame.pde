import java.util.*;
Maze maze;
Player player;
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
boolean end;

void setup() {
  size(600, 600);
  background(255);
  int n = 10;
  char[][] m=new char[n][n];
  for (int i=0; i<m.length; i++) {
    for (int j=0; j<m[0].length; j++) {
      m[i][j]='#';
    }
  }

  maze = new Maze(m);
  player = new Player(maze);
  
  int monsterLim = n/5;
  if (monsterLim == 0) monsterLim++;
  for (int i = 0; i < monsterLim; i++){
    enemyList.add(new Enemy(maze, n));
  } 
  //println(enemyList);
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
