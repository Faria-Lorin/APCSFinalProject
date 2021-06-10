import java.util.*;
public class Maze {
  char[][] maze;
  int currentR, currentC, startR, startC, steps, endR, endC, max;
  ArrayList<Character> directions = new ArrayList<Character>();
  int startX, startY, endX, endY;
  int theme, times, threshold;
  char last;

  Maze(char[][] m, int n) {
    maze=m;
    theme = n;
    times = 0;
    threshold =  (int)random(2) + 1;
    int startrow=(int)(Math.random()*(maze.length-2))+1;
    int startcol=(int)(Math.random()*(maze[0].length-2))+1;
    startR = startrow;
    startC = startcol;
    generate(maze, maze.length, maze[0].length, startrow, startcol);
  }

  boolean carvable() {
    ArrayList<Character> list = new ArrayList<Character>();
    if (maze[currentR][currentC] == '#') {
      if (check(currentR, currentC) <= 1) {
        maze[currentR][currentC] = ' ';
      } else return false;
    }
    if (maze[currentR][currentC] == ' ') {
      if (currentR+1 < maze.length-1 && maze[currentR+1][currentC] == '#' && check(currentR+1, currentC)) {//checks if south is open
        list.add('s');
      }
      if (currentR-1 > 0 && maze[currentR-1][currentC] == '#' && check(currentR-1, currentC)) {//checks if north is open
        list.add('n');
      }
      if (currentC-1 > 0 && maze[currentR][currentC-1] == '#' && check(currentR, currentC-1)) {//checks if west is open
        list.add('w');
      }
      if (currentC+1 < maze[0].length-1 && maze[currentR][currentC+1] == '#' && check(currentR, currentC+1)) {//checks if east is open
        list.add('e');
      }
    }

    if (list.size() > 0) {
      int random = (int)(Math.random() * list.size());
      char a = list.get(random); 
      if (directions.size() > 0 && times < threshold){
        if (list.contains(last)) {
          a = last;
          times ++;
        }
        
      }
      else times = 0;
      if (a == 's') {
        currentR = currentR+1;
        directions.add('s');
        last = 's';
        return true;
      } else if (a == 'n') {
        currentR = currentR-1;
        directions.add('n');
        last = 'n';
        return true;
      } else if (a == 'w') {
        currentC = currentC-1;
        directions.add('w');
        last = 'w';
        return true;
      } else if (a == 'e') {
        currentC = currentC+1;
        directions.add('e');
        last = 'e';
        return true;
      }
    }
    return false;
  }

  // back - backtracks if maze is no longer carvable from the current coordinates
  boolean back() {
    if (directions.size() > 0 ) {
      char last = directions.remove(directions.size()-1);
      if (last == 'n') {//checks if south has string
        currentR = currentR+1;
        return true;
      } else if (last == 's') {//checks if north has string
        currentR = currentR-1;
        return true;
      } else if (last == 'e') {//checks if west has string
        currentC = currentC-1;
        return true;
      } else if (last == 'w') {//checks if east has string
        currentC = currentC+1;
        return true;
      }
    }
    return false;
  }
  
  // check - checks that there is less than 2 spaces near a wall/block so that no loops can be created
  boolean check(int r, int c) {
    int count = 0;
    if (r+1 < maze.length-1 && maze[r+1][c] == ' ') count++;
    if (r-1 > 0 && maze[r-1][c] == ' ') count++;
    if (c-1 > 0 && maze[r][c-1] == ' ') count++;
    if (c+1 < maze[0].length-1 && maze[r][c+1] == ' ') count++;
    return count <= 1;
  }

  //generate - uses helper methods to generate maze
  void generate(char[][] maze, int rows, int cols, int startrow, int startcol) {
    currentR = startrow;
    currentC = startcol;
    if (carvable()) {
      steps++;
      generate(maze, rows, cols, currentR, currentC);
    } else if (back()) {
      if (steps > max) {
        max = steps;
        endR = startrow;
        endC = startcol;
      }
      steps--;
      generate(maze, rows, cols, currentR, currentC);
    } else {
      maze[startR][startC] = 'S';
      maze[endR][endC] = 'E';
    }
  }

  //testing method
  String toString() {
    String ans="";
    for (int i=0; i<maze.length; i++) {
      for (int j=0; j<maze[i].length; j++) {
        ans+=maze[i][j];
      }
      if (i!=maze.length-1) ans+="\n";
    }
    return ans;
  }

  //display - scales blocks/maze to fit the screen and display walls, open spaces, start, and end.
  void display() {
    int y=0;
    for (int i=0; i<maze.length; i++) {
      int x=0;
      for (int j=0; j<maze[i].length; j++) {
        textSize((scaleX()+scaleY())/2);
        if (maze[i][j]=='#') {
          if (theme==0){
            stroke(0);
            fill(0);
          }
          if (theme==1){
            strokeWeight(3);
            stroke(125, 91, 24);
            fill(158, 125, 63);
          }
          rect(x, y, scaleX(), scaleY());
        } else if (maze[i][j]=='S') {
          stroke(color(#89FF89));
          fill(color(#89FF89));
          rect(x, y, scaleX(), scaleY());
          fill(0);
          text('S', x+0.3*scaleX(), y+0.9*scaleY());
        } else if (maze[i][j]=='E') {
          stroke(color(#EB89FF));
          fill(color(#EB89FF));
          rect(x, y, scaleX(), scaleY());
          fill(0);
          text('E', x+0.3*scaleX(), y+0.9*scaleY());
        } else if (maze[i][j] == ' ') { 
          if (theme==0){
            stroke(255);
            fill(255); 
          }
          if (theme==1){
            stroke(215, 181, 113);
            fill(215, 181, 113);
          }
          rect(x, y, scaleX(), scaleY());
        }
        x+=scaleX();
      }
      y+=scaleY();
    }
  }

  //get/set methods
  int getStart(int xy) {
    if (xy == 0) return startR;
    if (xy == 1) return startC;
    else return 0;
  }

  int getEnd(int xy) {
    if (xy == 0) return endR;
    if (xy == 1) return endC;
    else return 0;
  }

  char getChar(int r, int c) {
    return maze[r][c];
  }

  float scaleX() {
    return width/maze.length;
  }

  float scaleY() {
    return height/maze[0].length;
  }
  
  int getTheme(){
    return theme;
  }
  void setTheme(int n){
    theme=n;
  }
}
