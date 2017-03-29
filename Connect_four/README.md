# Connect Four

### Description

This program uses the Ruby language to run a connect four game in the terminal. Included are tests written in RSpec. 

### Running

To run the game, you must first create an object of the Game class. Upon initialization, Game triggers the play loop, which all other methods run through until the game_over variable is set to false. The place_piece method asks the user to pick a column on the board where the first player(R) would like to drop their piece. Check_move validates that their response is on the board, and places their move appropriately. Change_turn switches the current_turn variable to Y, and the second player places a piece on the board. 

This continues until four R or Y pieces are placed in a row, which the check_for_winner method accounts for. The game_over variable is set to true, the play loop ends, and a message is sent to the screen congratulating the winner.


### Acknowledgments

This is my solution to the Testing Ruby project provided by The Odin Project http://www.theodinproject.com/courses/ruby-programming/lessons/testing-ruby?ref=lc-pb