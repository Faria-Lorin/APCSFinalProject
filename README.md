# APCSFinalProject

Prototype Link: https://docs.google.com/document/d/1HIrnpP4wmg8S-TKvkumwbK4C_VrWr5WTcYdeHXV1jfM/edit

Group Name: Maze Monsters

Group Members: Faria Lorin, Ella Krechmer

Project Description: Players go through a randomly constructed maze while avoiding and defeating various enemies.

Compile/Run instructions:

  1. Copy the repo into a directory on your computer
  2. Open the files with Processing and click run
  3. Click start game to start the game
  4. Use arrow keys to move the player and navigate through the maze while avoiding or destroying enemies. Hold the spacebar to shoot the enemy and kill them. Try to reach the end of the maze without losing all your lives.
  5. After reaching the end of the maze or losing all your lives, click play again if you want to play again.

__Development Log__

_Ella_

05/25 - Today I worked on creating the maze. I created the main sketch and the Maze class, where I then inputted the generate and comparable methods from our MazeGenerator assignment, and used as part of the constructor for the maze. I also made a display method for the maze, which allows it to be scaled to fit the entire screen, regardless of the size of the screen or the maze array.


05/27 - Today I worked on adding some nice-looking features to the Maze and Player Class, and worked on ending and restarting the game. For the Player, I fixed the color so that it wouldn't be flashing and constantly changing, and I changed the size, because I found that at the current scale, it was very difficult to see the player in a large maze. For the Maze, I added colored backgrounds to the S and E spots so that they would be easier to find among the black and white maze. Most of my work today was on ending and restarting the game. I ended the game when the player won or lost all their lives and created an end screen with a working "Play Again" button that allows you to play a brand new game (generates a brand new maze).

05/29 - I created the start screen for the game and commented the code in the main sketch. For the start screen, I created a start button that creates the maze, modified the end the playAgain() method to return to the start screen when the player tries to play a new game, and added the title of the game. I also went through all the code in the main sketch (MazeGame) and added some comments to make the code more understandable in places where there was a lot of code that might not have made sense.

06/01 - I created the die method for Player, simplified the die method for Enemy, completely updated the UML diagram and the prototype document to account for all the changes we made and goals we achieved, imported and scaled an image of a heart to represent the lives (make it look better than just the lines), and removed extra variables that we weren't using. I also merged the player branch with main, deleted the ella and player branches, and created the demo branch. Faria and I also discussed what we would say during our presentation.


_Faria_

05/25 - Today I worked on adding an end location for the maze generated in the Maze class by using some of my own code from the MazeGenerator assignment. I made it so that the end location is at the end of the longest route that is carved from the start location.


05/26 - I created the Player class and made a constructor, display method, and move method for the player so that the player can move through the maze and solve it, using the methods to update the MazeGame main sketch so that it has a draw method that displays the player and maze. I updated the get methods for the Maze class, editing the getStart and getEnd and adding methods that return the scaling values for the maze so that it can be used to scale the players and enemies so they correctly fit on maze displayed in the sketch.


05/27 - I created the Enemy class and added the constructor which sets a location for the enemy away from the start, a display method, and a move method that allows the enemy to move in random directions through the maze. I also updated the main sketch file so that several enemies are created and stored in an ArrayList during setup and enemy move and enemy display are called in the draw method.


05/29 - I added to the display methods in the Enemy class and Player class, giving the enemies and players different facial characteristics to help distinguish them from each other and also make them look better.


05/30 - I created a shoot method for player that allows the user to shoot at an enemy in the direction that the player previous moved by holding the spacebar and I added a die method in the Enemy class (called in draw), so that enemies are killed by the bullets. I added to the display method to display the bullets and also display the number of lives the player has left using hearts.


06/01 - Fixed a bug in the shoot method so that the bullet location is reset to the player location after the bullet hits the wall even if the spacebar is still held.


06/04 - Added instructions in the README file to explain how to compile the game and play it.


06/07 - I changed the colors of the maze and made it so that when the player is in the same spot as the enemy, the player loses a life, but the enemy no longer dies (the player is instead given invincibility for a few seconds to move away from the enemy). I also added levels (easy, medium, difficult, endless) where the size of the maze changes depending on the difficulty.
