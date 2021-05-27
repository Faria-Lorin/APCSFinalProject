# APCSFinalProject

Prototype Link: https://docs.google.com/document/d/1HIrnpP4wmg8S-TKvkumwbK4C_VrWr5WTcYdeHXV1jfM/edit

Group Name: Maze Monsters

Group Members: Faria Lorin, Ella Krechmer

Project Description: Players go through a randomly constructed maze while avoiding and defeating various enemies.

__Development Log__

_Ella_

05/25-Today I worked on creating the maze. I created the main sketch and the Maze class, where I then inputted the generate and comparable methods from our MazeGenerator assignment, and used as part of the constructor for the maze. I also made a display method for the maze, which allows it to be scaled to fit the entire screen, regardless of the size of the screen or the maze array.


_Faria_

05/25 - Today I worked on adding an end location for the maze generated in the Maze class. I modified the generate method Ella added and used some of my own code from the MazeGenerator assignment to add more helper methods to generate the maze. I made it so that the end location is at the end of the longest route that is carved from the start location.


_Faria_

05/26 - Today I worked on creating and updating the Player class. I made a constructor, display method, and move method for the player so that the player can move through the maze and solve it. I updated the MazeGame class so that it has a draw method that displays the player and maze. I updates the getStart and getEnd methods for the Maze class so that it returns the row and column coordinates of the start and end for the player to use in the player class. I also added a method that returns the scaling values for the maze so that it can be used to scale the players and enemies so they correctly fit on maze displayed in the sketch.
