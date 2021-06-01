import java.util.*;
public class Player {
  int playerR, playerC;
  int shootR, shootC, n, t;
  int lives, size;
  char lastDirection, shootDirection;
  boolean shoot;
  color c;
  Maze maze;
  
  Player(Maze m, int n) {
    maze = m;
    playerR = maze.getStart(0);
    playerC = maze.getStart(1);
    size = n;
    lives = 3;
    c = color(random(255), random(255), random(255));
    while (c == color(0) || c == color(255) || c == color(110, 33, 176)) {
      c = color(random(255), random(255), random(255));
    }
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(c);
    float Xcor = maze.scaleX() * playerC + maze.scaleX()/6;
    float Ycor = maze.scaleY() * playerR + maze.scaleY()/4.75;
    rect(Xcor, Ycor, maze.scaleX()/1.5, maze.scaleY()/1.5);
    
    //bullet
    if (keyPressed == true && key == 32) {
      shoot = true;
      if (n < size && shoot == true) {
        shoot();
        //bulllet display
        stroke(c);
        fill(c);
        ellipse(maze.scaleX() * shootC + maze.scaleX()/2, maze.scaleY() * shootR + maze.scaleY()/2, maze.scaleX()/6, maze.scaleY()/6);
      }
      else{
        shootR = playerR;
        shootC = playerC;
      }
    } else {
      n = 0;
      shootR = playerR;
      shootC = playerC;
      shootDirection = lastDirection;
    }
    
    //lives display
    stroke(255,0,0);
    strokeWeight(100/size);
    for (int i = 2; i < lives+2; i++){
      line(maze.scaleX() * (i) + maze.scaleX()/3, maze.scaleY() * (size-1) + maze.scaleY()/3, maze.scaleX() * (i) + maze.scaleX()/2 , maze.scaleY() * (size-1) + maze.scaleY()/1.5);
      line(maze.scaleX() * (i) + maze.scaleX()/2, maze.scaleY() * (size-1) + maze.scaleY()/1.5,  maze.scaleX() * (i) + maze.scaleX()/1.5, maze.scaleY() * (size-1) + maze.scaleY()/3);
    }
    
    //eyes
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(Xcor + maze.scaleX()/6, Ycor + maze.scaleY()/4, maze.scaleX()/6 + 1, maze.scaleY()/6 +1);
    ellipse(Xcor + maze.scaleX()/2, Ycor + maze.scaleY()/4, maze.scaleX()/6 +1, maze.scaleY()/6 + 1);
    fill(0);
    ellipse(Xcor + maze.scaleX()/5.5, Ycor + maze.scaleY()/3.6, maze.scaleX()/20, maze.scaleY()/20);
    ellipse(Xcor + maze.scaleX()/2.0, Ycor + maze.scaleY()/3.6, maze.scaleX()/20, maze.scaleY()/20);
    
    //mouth
    arc(Xcor + maze.scaleX()/2.7, Ycor + maze.scaleY()/2.4, maze.scaleX()/4, maze.scaleY()/4, 0, PI/1.1, CHORD);
  

  }

  void move() {
    if (keyPressed == true && keyCode == UP) {
      if (maze.getChar(playerR - 1, playerC) != '#')
        playerR--;
      lastDirection = 'n';
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == DOWN) {
      if (maze.getChar(playerR + 1, playerC) != '#')
        playerR++;
      lastDirection = 's';
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == LEFT) {
      if (maze.getChar(playerR, playerC - 1) != '#')
        playerC--;
      lastDirection = 'w';
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == RIGHT) {
      if (maze.getChar(playerR, playerC + 1) != '#')
        playerC++;
      lastDirection = 'e';
      keyPressed = false;
    }
  }
  void shoot() {

    //moving bullet --> t = making movement display slower;
    if (t == 5) {
      if (shootDirection == 'n') {
        if (maze.getChar(shootR - 1, shootC) != '#')
          shootR--;
        else shoot = false;
      }
      if (shootDirection == 's') {
        if (maze.getChar(shootR + 1, shootC) != '#')
          shootR++;
        else shoot = false;
      }
      if (shootDirection == 'w') {
        if (maze.getChar(shootR, shootC - 1) != '#')
          shootC--;
        else shoot = false;
      }
      if (shootDirection == 'e') {
        if (maze.getChar(shootR, shootC + 1) != '#')
          shootC++;   
        else shoot = false;
      }
      t = 0;
      n++;
    } else t++;
  }
  
  void die(int r, int c){
    if (r==playerR && c==playerC) lives--;
  }
  
  //get methods
  int getR() {
    return playerR;
  }

  int getC() {
    return playerC;
  }
  
  int getShootR() {
    return shootR;
  }

  int getShootC() {
    return shootC;
  }

  int getLives() {
    return lives;
  }
}
