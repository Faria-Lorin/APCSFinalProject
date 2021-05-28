import java.util.*;
public class Maze {
  char[][] maze;
  int currentR, currentC, startR, startC, steps, endR, endC, max;
  ArrayList<Character> directions = new ArrayList<Character>();
  int startX, startY, endX, endY;
  float startXCor, startYCor, endXCor, endYCor;

  Maze(char[][] m) {
    maze=m;
    int startrow=(int)(Math.random()*(maze.length-2))+1;
    int startcol=(int)(Math.random()*(maze[0].length-2))+1;
    startR = startrow;
    startC = startcol;
    generate(maze, maze.length, maze[0].length, startrow, startcol);
  }

  boolean openDirection() {
    ArrayList<Character> list = new ArrayList<Character>();
    if (maze[currentR][currentC] == '#') {
      if (check(currentR, currentC) <= 1) {
        maze[currentR][currentC] = ' ';
      } else return false;
    }
    if (maze[currentR][currentC] == ' ') {
      if (currentR+1 < maze.length-1 && maze[currentR+1][currentC] == '#' && check(currentR+1, currentC) <= 1) {//checks if south is open
        list.add('s');
      }
      if (currentR-1 > 0 && maze[currentR-1][currentC] == '#' && check(currentR-1, currentC) <= 1) {//checks if north is open
        list.add('n');
      }
      if (currentC-1 > 0 && maze[currentR][currentC-1] == '#' && check(currentR, currentC-1) <= 1) {//checks if west is open
        list.add('w');
      }
      if (currentC+1 < maze[0].length-1 && maze[currentR][currentC+1] == '#' && check(currentR, currentC+1) <= 1) {//checks if east is open
        list.add('e');
      }
    }

    if (list.size() > 0) {
      int random = (int)(Math.random() * list.size());
      char a = list.get(random); 
      if (a == 's') {
        currentR = currentR+1;
        directions.add('s');
        return true;
      } else if (a == 'n') {
        currentR = currentR-1;
        directions.add('n');
        return true;
      } else if (a == 'w') {
        currentC = currentC-1;
        directions.add('w');
        return true;
      } else if (a == 'e') {
        currentC = currentC+1;
        directions.add('e');
        return true;
      }
    }
    return false;
  }

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

  int check(int r, int c) {
    int count = 0;
    if (r+1 < maze.length-1 && maze[r+1][c] == ' ') count++;
    if (r-1 > 0 && maze[r-1][c] == ' ') count++;
    if (c-1 > 0 && maze[r][c-1] == ' ') count++;
    if (c+1 < maze[0].length-1 && maze[r][c+1] == ' ') count++;
    return count;
  }

  void generate(char[][] maze, int rows, int cols, int startrow, int startcol) {
    currentR = startrow;
    currentC = startcol;
    if (openDirection()) {
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

  void display() {
    int y=0;
    for (int i=0; i<maze.length; i++) {
      int x=0;
      for (int j=0; j<maze[i].length; j++) {
        textSize((scaleX()+scaleY())/2);
        if (maze[i][j]=='#') {
          stroke(0);
          fill(0);
          rect(x, y, scaleX(), scaleY());
        } else if (maze[i][j]=='S') {
          stroke(color(#89FF89));
          fill(color(#89FF89));
          rect(x, y, scaleX(), scaleY());
          fill(0);
          text('S', x+0.3*scaleX(), y+0.9*scaleY());
          startXCor=x+0.3*scaleX();
          startYCor=y+0.9*scaleY();
        } else if (maze[i][j]=='E') {
          stroke(color(#EB89FF));
          fill(color(#EB89FF));
          rect(x, y, scaleX(), scaleY());
          fill(0);
          text('E', x+0.3*scaleX(), y+0.9*scaleY());
          endXCor=x+0.3*scaleX();
          endYCor=y+0.9*scaleY();
        } else if (maze[i][j] == ' ') { 
          stroke(255);
          fill(255); 
          rect(x, y, scaleX(), scaleY());
        }
        x+=scaleX();
      }
      y+=scaleY();
    }
  }

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
}
