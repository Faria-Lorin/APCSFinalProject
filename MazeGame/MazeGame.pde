import java.util.*;
Maze maze;
Player player;
ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
boolean end, livesgone, win, started, dead, levelSet, pause;
int time, level, size, theme, points, currentLevel, highscore;

void setup() {
  size(600, 600);
  background(255);
  //displayStart();
  if (!levelSet) {
    size = 10; 
    theme = 0;
    points = 200000;
    highscore=0;
  }
  char[][] m=new char[size][size];
  for (int i=0; i<m.length; i++) {
    for (int j=0; j<m[0].length; j++) {
      m[i][j]='#';
    }
  }

  maze = new Maze(m, theme);

  int monsterLim = size/3;
  if (monsterLim == 0) monsterLim++;
  for (int i = 0; i < monsterLim; i++) {
    enemyList.add(new Enemy(maze, size));
  } 

  player = new Player(maze, size);
  if (level == 4) {
    maze.display();
    currentLevel++;
  }
}

void draw() {
  if (!pause) {
    //check to see if the game has ended
    if (!end) {
      end();
      points -= 1;
    }
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
          if (time < 500 && dead) {
            time ++;
            player.setStroke(color(254, 254, 0), 5);
          } else {
            dead = false; 
            time = 0; 
            player.setStroke( color(0), 1);
          }
        }
        //removes an enemy from the list if it's dead;
        for (int i=0; i<enemyList.size(); i++) {
          if (enemyList.get(i).isDead()) {
            points += 300;
            enemyList.remove(i);
            i--;
          }
        }
        //display lives
        textSize(maze.scaleY()/2);
        fill(255);
        text("LIVES: ", maze.scaleX()/2, size * maze.scaleY() - maze.scaleY()/4 );
        if (level == 4) {
          text("SCORE: " + points, maze.scaleX()/2, maze.scaleY() - maze.scaleY()/4 );
          text("LEVEL: " + currentLevel, size* maze.scaleX()/1.2 - maze.scaleX(), size* maze.scaleY() - maze.scaleY()/4 );
        }
        displayExit();
      }
      //if the game hasn't started yet, display the start page
      else if (started && !levelSet) {
        displayLevels();
      } else if (!started) {
        displayStart();
      }
    }
    //if the game has ended, display the end screen
    else {
      displayEnd();
    }
  } else {
    displayPrompt();
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
    livesgone = false;
    started=false;
  }
}

//when the Play Again button is pressed, we reset everything
void playAgain() {
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/2-height/24 && mouseY<=height/2+height/24)) {
    end=false;
    started=false;
    enemyList.clear();
    setup();
  }
}

//when the Start button is pressed, started is set to true, which causes the maze to be drawn
void startGame() {
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/1.5-height/24 && mouseY<=height/1.5+height/24)) {
    started=true;
    levelSet = false;
  }
}

void chooseLevel() {
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/4.5-height/24 && mouseY<=height/4.5+height/24)) {
    levelSet = true;
    level = 1;
    size = (int)random(3) + 10;
  } else if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>= 2*height/4.5-height/24 && mouseY<=2*height/4.5+height/24)) {
    levelSet = true;
    level = 2;
    size = (int)random(3) + 15;
  } else if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=3*height/4.5-height/24 && mouseY<=3*height/4.5+height/24)) {
    levelSet = true;
    level = 3;
    size = (int)random(3) + 25;
  } else if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=4*height/4.5-height/24 && mouseY<=4*height/4.5+height/24)) {
    levelSet = true;
    level = 4;
    size = 10;
  }
  if (levelSet) {
    enemyList.clear();
    setup();
  }
}

void chooseTheme() {
  //black and white button
  if ((mouseX>=width/3-width/4 && mouseX<=width/3+width/4) && (mouseY>=height/1.8-height/16 && mouseY<=height/1.8+height/16)) {
    maze.setTheme(0);
    theme = 0;
  }
  //tomb button
  else if ((mouseX>=2*width/3-width/4 && mouseX<=2*width/3+width/4) && (mouseY>=height/1.8-height/16 && mouseY<=height/1.8+height/16)) {
    maze.setTheme(1);
    theme = 1;
  }
}

void displayEnd() {
  if (livesgone || level != 4) {
    background(#E5FFFD);
    //if game ended because player ran out of lives
    if (livesgone) {
      fill(0);
      text("No More Lives--Game Over", width/5, height/3);
    } 
    //if game ended because player completed the maze
    else if (win) {
      fill(0);
      text("You Win! Great Job!", width/3.5, height/3);
    }
    if (level == 4) {
      text("SCORE: " + points, width/2-width/6, 2.15*height/3);
      if (points>highscore) {
        text("New High Score!", width/2-width/6, 2.3*height/3);
        highscore=points;
      }
      else{
        text("High Score: "+highscore,width/2-width/6, 2.3*height/3);
      }
    }
    //play again button
    //actual button
    rectMode(CENTER);
    if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/2-height/24 && mouseY<=height/2+height/24)) {
      stroke(0);
      strokeWeight(1.5);
      fill(110, 33, 176, 100);
    } else {
      stroke(0);
      strokeWeight(1);
      fill(#FFC271);
    }
    rect(width/2, height/2, width/3, height/12, 20);
    rectMode(CORNER);
    //text
    textSize(height/20);
    if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/2-height/24 && mouseY<=height/2+height/24)) {
      fill(#FFC271);
    } else fill(0);
    text("Play Again", width/2-width/8.5, height/2+height/48);
  } else if (!livesgone && level == 4) {
    enemyList.clear();
    size++;
    setup();
    end = false;
    started = true;
    levelSet = true;
  }
}

void displayStart() {
  background(#E5F0FF);
  //name
  textSize(height/7);
  fill(110, 33, 176);
  textAlign(CENTER);
  text("Monster", width/2, height/4);
  text("Maze", width/2, height/2.5);
  textAlign(LEFT);

  //start button
  //actual button
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/1.5-height/24 && mouseY<=height/1.5+height/24)) {
    stroke(0);
    strokeWeight(1.5);
    fill(110, 33, 176, 100);
  } else {
    stroke(0);
    strokeWeight(1);
    fill(#FFC271);
  }

  rectMode(CENTER);
  rect(width/2, height/1.5, width/3, height/12, 20);
  rectMode(CORNER);
  //text
  textSize(height/20);
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/1.5-height/24 && mouseY<=height/1.5+height/24)) {
    fill(#FFC271);
  } else fill(0);
  text("Start", width/2-width/17, height/1.5+height/48);

  //level selected
  //Choose Theme text
  textSize(height/24);
  fill(0);
  textAlign(CENTER);
  text("Choose Theme", width/2, height/2-height/80);
  textAlign(LEFT);

  //Black and White Button
  rectMode(CENTER);
  //theme=0 means black and white, theme=1 means tomb
  if (maze.getTheme()==0) {
    stroke(#05FA03);
    strokeWeight(1.5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  fill(255);
  rect(width/3, height/1.8, width/4, height/16, 20);
  rectMode(CORNER);
  //text
  textSize(height/40);
  fill(0);
  text("Black and White", width/3-width/10.5, height/1.8+height/76);

  //Tomb Button
  rectMode(CENTER);
  //theme=0 means black and white, theme=1 means tomb
  if (maze.getTheme()==1) {
    stroke(#05FA03);
    strokeWeight(1.5);
  } else {
    stroke(125, 91, 2);
    strokeWeight(1);
  }
  fill(215, 181, 113);
  rect(2*width/3, height/1.8, width/4, height/16, 20);
  rectMode(CORNER);
  //text
  textSize(height/40);
  fill(0);
  text("Tomb", 2*width/3-width/27, height/1.8+height/76);
}

void displayLevels() {
  background(#CCCCFF);
  textSize(height/10);
  fill(110, 33, 176);
  stroke(0);
  textAlign(CENTER);
  text("LEVEL", width/2, height/8);
  textAlign(LEFT);

  //level buttons
  //actual button
  rectMode(CENTER);
  for (int i = 1; i <= 4; i++) {
    if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=i*height/4.5-height/24 && mouseY<=i*height/4.5+height/24)) {
      stroke(0);
      strokeWeight(1.5);
      fill(110, 33, 176, 100);
    } else {
      stroke(0);
      strokeWeight(1);
      fill(#FFC271);
    }
    rect(width/2, i*height/4.5, width/3, height/12, 20);
  }
  rectMode(CORNER);
  //text
  textSize(height/20);
  //Easy
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=height/4.5-height/24 && mouseY<=height/4.5+height/24)) {
    fill(#FFC271);
  } else fill(0);
  text("Easy", width/2-width/19, height/4.5+height/48);
  //Medium
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=2*height/4.5-height/24 && mouseY<=2*height/4.5+height/24)) {
    fill(#FFC271);
  } else fill(0);
  text("Medium", width/2-width/11, 2*height/4.5+height/48);
  //Difficult
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=3*height/4.5-height/24 && mouseY<=3*height/4.5+height/24)) {
    fill(#FFC271);
  } else fill(0);
  text("Difficult", width/2-width/11, 3*height/4.5+height/48);
  //Endless
  if ((mouseX>=width/2-width/6 && mouseX<=width/2+width/6) && (mouseY>=4*height/4.5-height/24 && mouseY<=4*height/4.5+height/24)) {
    fill(#FFC271);
  } else fill(0);
  text("Endless", width/2-width/11, 4*height/4.5+height/48);
}

void displayExit() {
  if ((mouseX>=width-1.75*maze.scaleX() && mouseX<=width-1.75*maze.scaleX()+1.5*maze.scaleX()) &&(mouseY>=maze.scaleY()/6 && mouseY<=maze.scaleY()/6+maze.scaleY()/2)) {
    fill(255);
    strokeWeight(1.5);
    stroke(255, 0, 0);
  } else {
    fill(255, 0, 0);
    strokeWeight(0.5);
    stroke(0);
  }
  rect(width-1.75*maze.scaleX(), maze.scaleY()/6, 1.5*maze.scaleX(), maze.scaleY()/2, 5);
  if ((mouseX>=width-1.75*maze.scaleX() && mouseX<=width-1.75*maze.scaleX()+1.5*maze.scaleX()) &&(mouseY>=maze.scaleY()/6 && mouseY<=maze.scaleY()/6+maze.scaleY()/2)) {
    fill(255, 0, 0);
  } else fill(0);
  textSize(maze.scaleX()/2.25);
  text("Exit", width-1.75*maze.scaleX()+0.35*maze.scaleX(), maze.scaleY()/6+maze.scaleY()/2.4);
}

//exit - lets you pause the game, while the game asks you if you are sure you want to exit
void exit() {
  if ((mouseX>=width-1.75*maze.scaleX() && mouseX<=width-1.75*maze.scaleX()+1.5*maze.scaleX()) &&(mouseY>=maze.scaleY()/6 && mouseY<=maze.scaleY()/6+maze.scaleY()/2)) {
    pause = true;
  }
}

//displayPrompt - aks you if you really want to exit or not (just to make sure);
void displayPrompt() {

  //displays YES button
  if ((mouseX>=width/7 && mouseX<=width/7 + width/3) && (mouseY>=height/2.3 && mouseY<=height/2.3 + height/12)) {
    stroke(0);
    strokeWeight(3);
    fill(#FF007F);
  } else {
    stroke(0);
    strokeWeight(1.5);
    fill(#F3B9D4);
  }
  //rectMode(CENTER);
  rect(width/7, height/2.3, width/3, height/12, 20);
  //rectMode(CORNER);
  //text
  textSize(height/20);
  if ((mouseX>=width/7 && mouseX<=width/7+width/3) && (mouseY>=height/2.3 && mouseY<=height/2.3+height/12)) {
    fill(#FFCCE5);
  } else fill(#CD5E92);
  text("YES", width/7 + width/8, height/2 - 0.3);

  //displays NO button
  if ((mouseX>=width/1.9 && mouseX<=width/1.9+width/3) && (mouseY>=height/2.3 && mouseY<=height/2.3+height/12)) {
    stroke(0);
    strokeWeight(3);
    fill(#0659FF);
  } else {
    stroke(0);
    strokeWeight(1.5);
    fill(#8FC5FC);
  }

  //rectMode(CENTER);
  rect(width/1.9, height/2.3, width/3, height/12, 20);
  //rectMode(CORNER);
  //text
  textSize(height/20);

  if ((mouseX>=width/1.9 && mouseX<=width/1.9+width/3) && (mouseY>=height/2.3 && mouseY<=height/2.3+height/12)) {
    fill(#99CCFF);
  } else fill(#1370CD);
  text("NO", width/1.9 + width/8, height/2 - 0.3);
}

// promptAnswer - modifies screen/game according to your answer for the Yes/No prompt after exit
void promptAnswer() {
  if ((mouseX>=width/7 && mouseX<=width/7 + width/3) && (mouseY>=height/2.3 && mouseY<=height/2.3 + height/12)) {
    started=false;
    currentLevel=0;
    pause = false;
  } else if ((mouseX>=width/1.9 && mouseX<=width/1.9+width/3) && (mouseY>=height/2.3 && mouseY<=height/2.3+height/12)) {
    pause = false;
  }
}

void mousePressed() {
  if (end) playAgain();
  if (!end && started && !levelSet) chooseLevel();
  if (!end && !started) {
    startGame();
    chooseTheme();
    level=0;
  }
  if (started && levelSet && !end) exit();
  if (pause) promptAnswer();
}
