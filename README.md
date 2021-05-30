# APCSFinalProject

Prototype Link: https://docs.google.com/document/d/1HIrnpP4wmg8S-TKvkumwbK4C_VrWr5WTcYdeHXV1jfM/edit

Group Name: Maze Monsters

Group Members: Faria Lorin, Ella Krechmer

Project Description: Players go through a randomly constructed maze while avoiding and defeating various enemies.

__Development Log__

_Ella_

05/25 - Today I worked on creating the maze. I created the main sketch and the Maze class, where I then inputted the generate and comparable methods from our MazeGenerator assignment, and used as part of the constructor for the maze. I also made a display method for the maze, which allows it to be scaled to fit the entire screen, regardless of the size of the screen or the maze array.


05/27 - Today I worked on adding some nice-looking features to the Maze and Player Class, and worked on ending and restarting the game. For the Player, I fixed the color so that it wouldn't be flashing and constantly changing, and I changed the size, because I found that at the current scale, it was very difficult to see the player in a large maze. For the Maze, I added colored backgrounds to the S and E spots so that they would be easier to find among the black and white maze. Most of my work today was on ending and restarting the game. I ended the game when the player won or lost all their lives and created an end screen with a working "Play Again" button that allows you to play a brand new game (generates a brand new maze).

05/29 - I created the start screen for the game and commented the code in the main sketch. For the start screen, I created a start button that creates the maze, modified the end the playAgain() method to return to the start screen when the player tries to play a new game, and added the title of the game. I also went through all the code in the main sketch (MazeGame) and added some comments to make the code more understandable in places where there was a lot of code that might not have made sense.


_Faria_

05/25 - Today I worked on adding an end location for the maze generated in the Maze class. I modified the generate method Ella added and used some of my own code from the MazeGenerator assignment to add more helper methods to generate the maze. I made it so that the end location is at the end of the longest route that is carved from the start location.


05/26 - Today I worked on creating and updating the Player class. I made a constructor, display method, and move method for the player so that the player can move through the maze and solve it. I updated the MazeGame class so that it has a draw method that displays the player and maze. I updated the getStart and getEnd methods for the Maze class so that it returns the row and column coordinates of the start and end for the player to use in the player class. I also added a method that returns the scaling values for the maze so that it can be used to scale the players and enemies so they correctly fit on maze displayed in the sketch.


05/27 - I worked on creating and updating the Enemy class. I created the constructor which sets a location for the enemy away from the start, a display method, and a move method that allows the enemy to move in random directions through the maze. I also updated the main sketch file so that several enemies are created and stored in an ArrayList during setup and enemy move and enemy display are called in the draw method and the player is drawn/displayed after the enemies.
