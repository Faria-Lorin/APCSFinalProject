import java.util.*;
Maze maze;
Player player;
boolean end, livesgone, win;

void setup() {
  size(600, 600);
  background(255);
  char[][] m=new char[4][4];
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
  else {
    background(255);
    if (livesgone){
      text("No More Lives--Game Over", width/5, height/3);
    }
    else if (win){
      text("You Win! Great Job!", width/3.5, height/3);
    }
    
    rectMode(CENTER);
    fill(100);
    rect(width/2, height/2, width/3, height/12, 20);
    rectMode(CORNER);
    
    textSize(height/20);
    fill(0);
    text("Play Again", width/2-width/8.5, height/2+height/48);
  }
}

void end(){
  if (player.getLives()==0){
    livesgone=true;
    end=true;
  }
  else if (player.getR()==maze.getEnd()[0] && player.getC()==maze.getEnd()[1]){
    win=true;
    end=true;
  }
}
