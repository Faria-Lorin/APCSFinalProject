import java.util.*;
public class Player {
  int playerR, playerC;
  int lives;
  color c;
  Maze maze;
  Player(Maze m /*, ArrayList<Enemy*/){
    maze = m;
    playerR = maze.getStart(0);
    playerC = maze.getStart(1);
    lives = 3;
    c = color(random(255),random(255),random(255));
    while (c == color(0) || c == color(255) || c == color(110, 33, 176)){
      c = color(random(255),random(255),random(255));
   }
    
  }
  
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(c);
    float Xcor = maze.scaleX() * playerC + maze.scaleX()/6;
    float Ycor = maze.scaleY() * playerR + maze.scaleY()/4.75;
    rect(Xcor, Ycor, maze.scaleX()/1.5, maze.scaleY()/1.5);
    //eyes
    stroke(0);
    strokeWeight(1);
    fill(255);
    ellipse(Xcor + maze.scaleX()/6, Ycor + maze.scaleY()/4 , maze.scaleX()/6 + 1 , maze.scaleY()/6 +1);
    ellipse(Xcor + maze.scaleX()/2, Ycor + maze.scaleY()/4 , maze.scaleX()/6 +1, maze.scaleY()/6 + 1);
    fill(0);
    ellipse(Xcor + maze.scaleX()/5.5, Ycor + maze.scaleY()/3.6 , maze.scaleX()/20 , maze.scaleY()/20);
    ellipse(Xcor + maze.scaleX()/2.0, Ycor + maze.scaleY()/3.6 , maze.scaleX()/20 , maze.scaleY()/20);
    //mouth
    arc(Xcor + maze.scaleX()/2.7, Ycor + maze.scaleY()/2.4 , maze.scaleX()/4 , maze.scaleY()/4, 0, PI/1.1, CHORD);
  }
  
  void move(){
    if (keyPressed == true && keyCode == UP){
      if (maze.getChar(playerR - 1, playerC) != '#')
        playerR--;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == DOWN){
      if (maze.getChar(playerR + 1 , playerC) != '#')
        playerR++;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == LEFT){
      if (maze.getChar(playerR, playerC - 1) != '#')
        playerC--;
      keyPressed = false;
    }
    if (keyPressed == true && keyCode == RIGHT){
      if (maze.getChar(playerR, playerC + 1) != '#')
        playerC++;
      keyPressed = false;
    }
  }
  
  int getR(){
    return playerR;
  }
  
  int getC(){
    return playerC;
  }
  
  int getLives(){
    return lives;
  }
  
}
