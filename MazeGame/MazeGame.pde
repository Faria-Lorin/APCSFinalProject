import java.util.*;
Maze maze;
Player player;
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
boolean end, livesgone, win, started;

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

  int monsterLim = n/3;
  if (monsterLim == 0) monsterLim++;
  for (int i = 0; i < monsterLim; i++) {
    enemyList.add(new Enemy(maze, n));
  } 
  player = new Player(maze, n);
}

void draw() {
  //check to see if the game has ended
  end();
  //if the game isn't over
  if (end==false) {
    //if the game has already started, then display the maze, enemies, and player
    if (started) {
      maze.display();
      player.move();
      player.display();
      for (Enemy e : enemyList) {
        e.move();
        e.display();
        player.die(e.getR(), e.getC());
        e.die(player.getShootR(), player.getShootC());
      }
      //removes an enemy from the list if it's dead;
      for (int i=0; i<enemyList.size(); i++){
        if (enemyList.get(i).isDead()) {
          enemyList.remove(i);
          i--;
        }
      }
      //display lives
      textSize(maze.scaleY()/2);
      fill(255);
      text("LIVES: ", maze.scaleX()/2, height - maze.scaleY()/3);
    }
    //if the game hasn't started yet, display the start page
    else {
      background(#E5F0FF);
      //name
      textSize(height/7);
      fill(110, 33, 176);
      textAlign(CENTER);
      text("Monster", width/2, height/2.75);
      text("Maze", width/2, height/2);
      textAlign(LEFT);

      //start button
      //actual button
      rectMode(CENTER);
      fill(#FFC271);
      rect(width/2, height/1.5, width/3, height/12, 20);
      rectMode(CORNER);
      //text
      textSize(height/20);
      fill(0);
      text("Start", width/2-width/17, height/1.5+height/48);
    }
  }
  //if the game has ended, display the end screen
  else {
    background(#E5FFFD);
    //if game ended because player ran out of lives
    if (livesgone) {
      text("No More Lives--Game Over", width/5, height/3);
    } 
    //if game ended because player completed the maze
    else if (win) {
      text("You Win! Great Job!", width/3.5, height/3);
    }
    //play again button
    //actual button
    rectMode(CENTER);
    fill(#FFC271);
    rect(width/2, height/2, width/3, height/12, 20);
    rectMode(CORNER);
    //text
    textSize(height/20);
    fill(0);
    text("Play Again", width/2-width/8.5, height/2+height/48);
  }
}

//the game ends when a player loses all their lives or completes the maze
void end() {
  if (player.getLives()==0) {
    livesgone=true;
    end=true;
    started=false;
  } else if (player.getR()==maze.getEnd(0) && player.getC()==maze.getEnd(1)) {
    win=true;
    end=true;
    started=false;
  }
}

//when the Play Again button is pressed, we reset everything
void playAgain() {
  if ((mouseX>=width/2-width/3 && mouseX<=width/2+width/3) && (mouseY>=height/2-height/12 && mouseY<=height/2+height/12)) {
    end=false;
    started=false;
    enemyList.clear();
    setup();
  }
}

//when the Start button is pressed, started is set to true, which causes the maze to be drawn
void startGame() {
  if ((mouseX>=width/2-width/3 && mouseX<=width/2+width/3) && (mouseY>=height/1.5-height/12 && mouseY<=height/1.5+height/12)) {
    started=true;
  }
}

void mousePressed() {
  if (end) playAgain();
  startGame();
}
