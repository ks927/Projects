# Tic Tac Toe 

This is a simple game of Tic Tac Toe using object orientend programming in the Ruby language.

It is currently on version 1. On initialization, class Board creates a board with 9 indeces, a player "X", and a game_over checker that is set to false. To play, you must create an object of Board, call the Board's player_move method, and pick an index on the board. After each move, the game checks to see if that index has already been selected, checks for a winner, and finally, changes turn to the "O" player. 

Within the Board class, I created a check_for_winner method with all the possible winning combinations. If either "X" or "O" meet any of these combinations, the game_over instance variable is set to true and a winning message is displayed. The change_turn method is also halted if the game_over variable is set to true. 

The code that is commented out at the bottom is what I used as my goal to code for while I worked. Additionally, I have the winning combinations array commented out.

