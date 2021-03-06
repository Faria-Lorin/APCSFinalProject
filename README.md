# APCSFinalProject

Prototype Link: https://docs.google.com/document/d/1HIrnpP4wmg8S-TKvkumwbK4C_VrWr5WTcYdeHXV1jfM/edit

Group Name: Maze Monsters

Group Members: Faria Lorin, Ella Krechmer

Project Description: Players go through a randomly constructed maze while avoiding and defeating various enemies.

Compile/Run instructions:

  1. To Run the game:

      -First, copy the repo into a directory on your computer
      
      -Then, open the files with Processing and click run

  2. To Set up the game:

      -Choose a theme you want for the maze (either black and white or tomb)
      
      -Click the start button
      
      -Choose a level/mode of difficulty (endless mode is not really endless and has a maximum of 50 levels, but after you complete one maze you move on to a bigger maze)

  3. Solve the maze by controlling the player:

      -Use arrow keys to move the player and navigate through the maze while avoiding or destroying enemies (players cannot move through the walls of the maze).
      
      -Use the WASD keys shoot the bullet in different directions towards the enemies to kill them (W=up, A=left, S=down, D=right).
      
      -Avoid colliding with the enemy because you will lose a life.
      
      -If you do collide with the enemy, you will gain immunity (yellow border) for a few seconds, but so will the enemies, so you won't be able to kill them.
      
      -Try to reach the end of the maze without losing all your lives.
      
      -Try to solve the mazes as quickly as possible to earn the highest score (or get to the highest level if in endless mode). For easy level, the beginning score is 10000, for medium it is 20000, for difficult it is 30000, and for endless it is 200000. As you spend more time in the maze, your score decreases, but if you shoot and enemy, you get another 300 points, and if you're in endless mode and advance to the next level, you get 1000 points.

  4. Pausing Game + End of Game:

      -If you want to pause the game, press the exit button. Press the no button when you would like to unpause.
      
      -If you want to end the game before you lose your lives or solve the maze, you can press the exit button, then the yes button to confirm your choice.
      
      -After reaching the end of the maze or losing all your lives, click play again if you want to play again.

__Development Log__

_Ella_

05/25 - Today I worked on creating the maze. I created the main sketch and the Maze class, where I then inputted the generate and comparable methods from our MazeGenerator assignment, and used as part of the constructor for the maze. I also made a display method for the maze, which allows it to be scaled to fit the entire screen, regardless of the size of the screen or the maze array.


05/27 - Today I worked on adding some nice-looking features to the Maze and Player Class, and worked on ending and restarting the game. For the Player, I fixed the color so that it wouldn't be flashing and constantly changing, and I changed the size, because I found that at the current scale, it was very difficult to see the player in a large maze. For the Maze, I added colored backgrounds to the S and E spots so that they would be easier to find among the black and white maze. Most of my work today was on ending and restarting the game. I ended the game when the player won or lost all their lives and created an end screen with a working "Play Again" button that allows you to play a brand new game (generates a brand new maze).

05/29 - I created the start screen for the game and commented the code in the main sketch. For the start screen, I created a start button that creates the maze, modified the end the playAgain() method to return to the start screen when the player tries to play a new game, and added the title of the game. I also went through all the code in the main sketch (MazeGame) and added some comments to make the code more understandable in places where there was a lot of code that might not have made sense.

06/01 - I created the die method for Player, simplified the die method for Enemy, completely updated the UML diagram and the prototype document to account for all the changes we made and goals we achieved, imported and scaled an image of a heart to represent the lives (make it look better than just the lines), and removed extra variables that we weren't using. I also merged the player branch with main, deleted the ella and player branches, and created the demo branch. Faria and I also discussed what we would say during our presentation.

06/08 - I made a small directory in the start page that would let you choose between the two different themes we have (black and white vs a tomb), and adjusted the display method of Maze to change based on the selected theme (outlined in green on the screen). I also modified all six of the buttons we were using to change color when a player hovers over them with their mouse, and fixed a bug with the buttons that allowed you to click them even when you weren't within them. Finally, I created an exit button for all of the levels, which ends the game and takes you back to the home screen, and also has the same hover feature as all of the other buttons.

06/10 - I changed the shoot method so that instead of picking the direction using a WASD key and then shooting with the space bar, you pick the direction and shoot with the WASD keys right away. I also implemented high score for the endless mode, displaying it both in the end page and the levels page, and then I implemented scoring and high score for the other levels. I also changed the colors for the YES and NO buttons in the pause screen. I fixed some minor bugs that I kept seeing, merged the project to main, cleaned up the code, and updated the game instructions and the UML.


_Faria_

05/25 - I worked on adding an end location for the maze generated in the Maze class by using some of my own code from the MazeGenerator assignment. I made it so that the end location is at the end of the longest route that is carved from the start location.


05/26 - I created the Player class and made a constructor, display method, and move method for the player so that the player can move through the maze, using the methods to update the MazeGame main sketch so that it has a draw method that displays the player and maze. I updated the get methods for the Maze class, editing the getStart and getEnd and adding methods that return the scaling values for the maze so that it can be used to scale the players and enemies so they correctly fit on maze displayed in the sketch.


05/27 - I created the Enemy class and added the constructor which sets a location for the enemy away from the start, a display method, and a move method that allows the enemy to move in random directions through the maze. I also updated the main sketch file so that several enemies are created and stored in an ArrayList during setup and enemy move and enemy display are called in the draw method.


05/29 - I added to the display methods in the Enemy class and Player class, giving the enemies and players different facial characteristics to help distinguish them from each other and also make them look better.


05/30 - I created a shoot method for player that allows the user to shoot at an enemy in the direction that the player previous moved and I added a die method in the Enemy class (called in draw), so that enemies are killed by the bullets. I added to the player display method to display the bullets and also display the number of lives the player has left using hearts.


06/01 - Fixed a bug in the shoot method so that the bullet location is reset to the player location after the bullet hits the wall even if the spacebar is still held.


06/04 - Added instructions in the README file to explain how to compile the game and play it.


06/07 - I changed the colors of the maze and made it so that when the player is in the same spot as the enemy, the player loses a life, but the enemy no longer dies (the player is instead given invincibility for a few seconds to move away from the enemy). I also added levels (easy, medium, difficult, endless) where the size of the maze changes depending on the difficulty.


06/08 - I helped Ella create the option to choose the Maze Theme. I created a point system and level counter for the endless mode and added a displaying of final score to the end screen.


06/09 - I edited maze so that there are longer hallways (maze is carved in the same direction more) and changed shooting ability so that the direction of the bullet is controlled by WASD keys. I added the option to pause the game while confirming if you want to exit after you click the exit button.


06/10 - I fixed the scaling of the Maze. I helped Ella display the high score texts and I also added a high level display in the end/level screen for endless mode because a higher level in endless is better than a higher score.
