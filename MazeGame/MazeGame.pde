import java.util.*;
Maze maze;
Player player;
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
boolean end, livesgone, win;
>>>>>>> e8cecaac33a0ccfffb77dc63a321a853136ab6ca

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

void playAgain(){
  if ((mouseX>=width/2-width/3 && mouseX<=width/2+width/3) && (mouseY>=height/2-height/12 && mouseY<=height/2+height)){
    println("starting again");
  }
}

void mousePressed(){
  playAgain();
}
