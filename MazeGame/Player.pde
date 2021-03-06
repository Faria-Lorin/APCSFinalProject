import java.util.*;
public class Player {
  int playerR, playerC;
  int shootR, shootC, shootDist, shootSpeed;
  int lives, size, weight;
  boolean shoot;
  color c, s;
  Maze maze;

  //constuctor - sets player coordinates to start coordinates of maze, sets instance variable values.
  Player(Maze m, int n) {
    maze = m;
    playerR = maze.getStart(0);
    playerC = maze.getStart(1);
    size = n;
    lives = 3;
    c = color(random(255), random(255), random(255));
    while (c == color(0) || c == color(255) || c == color(110, 33, 176) || c == color(254, 254, 0) || c == color(158, 125, 63)  || c == color(215, 181, 113)) {
      c = color(random(255), random(255), random(255));
    }
    s = c;
    weight = 1;
  }

  //display - displays player and bullet in the maze
  void display() {
    stroke(s);
    strokeWeight(weight);
    fill(c);
    float Xcor = maze.scaleX() * playerC + maze.scaleX()/6;
    float Ycor = maze.scaleY() * playerR + maze.scaleY()/4.75;
    rect(Xcor, Ycor, maze.scaleX()/1.5, maze.scaleY()/1.5);

    //bullet
    if (keyPressed == true && (key == 'A' || key =='a' || key=='S' || key=='s' || key=='D' || key=='d' || key=='w' || key=='W')) {
      shoot = true;
      if (shootDist < size && shoot == true) {
        shoot();
        //bulllet display
        stroke(0);
        strokeWeight(0.5);
        ellipse(maze.scaleX() * shootC + maze.scaleX()/2, maze.scaleY() * shootR + maze.scaleY()/2, maze.scaleX()/6, maze.scaleY()/6);
        strokeWeight(1);
      } else {
        shootR = playerR;
        shootC = playerC;
      }
    } else {
      shootDist = 0;
      shootR = playerR;
      shootC = playerC;
    }

    //lives display
    for (int i = 2; i < lives+2; i++) {
      PShape heart=loadShape("heart2.svg");
      heart.disableStyle();
      heart.setFill(color(#FA0B03));
      heart.enableStyle();
      heart.scale(1/((float) size));
      shape(heart, maze.scaleX() * (i) + maze.scaleX()/3, maze.scaleY() * (size-1) + maze.scaleY()/7);
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

  // move - player moves using arrow keys
  void move() {
    if (keyPressed == true && keyCode == UP) {
      if (maze.getChar(playerR - 1, playerC) != '#')
        playerR--;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == DOWN) {
      if (maze.getChar(playerR + 1, playerC) != '#')
        playerR++;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == LEFT) {
      if (maze.getChar(playerR, playerC - 1) != '#')
        playerC--;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == RIGHT) {
      if (maze.getChar(playerR, playerC + 1) != '#')
        playerC++;
      keyPressed = false;
    }
  }

  //shoot -shoot sbullet depending on shootDirection;
  void shoot() {
    //moving bullet --> t = making movement display slower;
    if (shootSpeed == 4) {
      if (keyPressed && (key == 'W' || key == 'w')) {
        if (maze.getChar(shootR - 1, shootC) != '#')
          shootR--;
        else shoot = false;
      }
      if (keyPressed && (key == 'S' || key == 's')) {
        if (maze.getChar(shootR + 1, shootC) != '#')
          shootR++;
        else shoot = false;
      }
      if (keyPressed && (key == 'A' || key == 'a')) {
        if (maze.getChar(shootR, shootC - 1) != '#')
          shootC--;
        else shoot = false;
      }
      if (keyPressed && (key == 'D' || key == 'd')) {
        if (maze.getChar(shootR, shootC + 1) != '#')
          shootC++;   
        else shoot = false;
      }
      shootSpeed = 0;
      shootDist++;
    } else shootSpeed++;
  }

  //die - subtracts a life and returns true if player dies
  boolean die(int r, int c) {
    if (r==playerR && c==playerC) {
      lives--; 
      return true;
    } else return false;
  }

  //get/set methods
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

  void setStroke(int a, int b) {
    s = a;
    weight = b;
  }
}
