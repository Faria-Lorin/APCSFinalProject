import java.util.*;
Maze maze;
Player player;
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
boolean end, livesgone, win, started, dead, levelSet;
int time, level, size;

void setup() {
  size(600, 600);
  background(255);
  displayStart();
  if (!levelSet) size = 10;
  char[][] m=new char[size][size];
  for (int i=0; i<m.length; i++) {
    for (int j=0; j<m[0].length; j++) {
      m[i][j]='#';
    }
  }

  maze = new Maze(m);

  int monsterLim = size/2;
  if (monsterLim == 0) monsterLim++;
  for (int i = 0; i < monsterLim; i++) {
    enemyList.add(new Enemy(maze, size));
  } 

  player = new Player(maze, size);
}

void draw() {
  //check to see if the game has ended
  end();
  //if the game isn't over
  if (end==false) {
    //if the game has already started, then display the maze, enemies, and player
    if (started && levelSet) {
      maze.display();
      player.move();
      player.display();
      for (Enemy e : enemyList) {
        e.move();
        e.display();
        if (!dead)
          dead = player.die(e.getR(), e.getC());
        if (!dead) {
          e.die(player.getShootR(), player.getShootC());
        }
        if (time < 500 && dead){
          time ++;
          player.setStroke(color(254, 254, 0), 5);
        }
        else {dead = false; time = 0; player.setStroke( color(0), 1);}
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
      text("LIVES: ", maze.scaleX()/2, size * maze.scaleY() - maze.scaleY()/4 );
    }
    //if the game hasn't started yet, display the start page
    else if (started && !levelSet){
      displayLevels();
    }
    else {
      displayStart();
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
    levelSet = false;
    enemyList.clear();
    setup();
  }
}

//when the Start button is pressed, started is set to true, which causes the maze to be drawn
void startGame() {
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/1.5-height/12 && mouseY<=height/1.5+height/12)) {
    started=true;
    levelSet = false;
  }
}

void chooseLevel(){
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/4.5-height/12 && mouseY<=height/4.5+height/12)) {
    levelSet = true;
    level = 1;
    size = (int)random(5) + 10;
  }
  else if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>= 2*height/4.5-height/12 && mouseY<=2*height/4.5+height/12)) {
    levelSet = true;
    level = 2;
    size = (int)random(5) + 15;
  }
  else if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=3*height/4.5-height/12 && mouseY<=3*height/4.5+height/12)) {
    levelSet = true;
    level = 3;
    size = (int)random(5) + 25;
  }
  else if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=4*height/4.5-height/12 && mouseY<=4*height/4.5+height/12)) {
    levelSet = true;
    level = 4;
    size = 10;
  }
  if (levelSet) {
    enemyList.clear();
    setup();
  }
}

void displayStart(){
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

void displayLevels(){
      background(#CCCCFF);
      textSize(height/10);
      fill(110, 33, 176);
      textAlign(CENTER);
      text("LEVEL", width/2, height/8);
      textAlign(LEFT);

      //start button
      //actual button
      rectMode(CENTER);
      fill(#FFC271);
      for (int i = 1; i <= 4; i++){
        rect(width/2, i*height/4.5, width/3, height/12, 20);
      }
      rectMode(CORNER);
      //text
      textSize(height/20);
      fill(0);
      text("Easy", width/2-width/19, height/4.5+height/48);
      text("Medium", width/2-width/11, 2*height/4.5+height/48);
      text("Difficult", width/2-width/11, 3*height/4.5+height/48);
      text("Endless", width/2-width/11, 4*height/4.5+height/48);
}

void mousePressed() {
  if (end) playAgain();
  if (!end && started && !levelSet) chooseLevel();
  if (!end && !started) startGame();
}
