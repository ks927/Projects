class Board

    def initialize
        @board = [
            0, 1, 2,
            3, 4, 5,
            6, 7, 8
            ]
        @current_turn = "X"
        @game_over = false

    end

    def show_board
        print @board[0..2]
        print "\n"
        print @board[3..5]
        print "\n"
        print @board[6..8]
    end

    def change_turn
       @current_turn = @current_turn == "X" ? "O" : "X" unless @game_over == true
    end

    def player_move(index)
            if @board[index] == "X" || @board[index] == "O"
                puts "That space is taken"
                @current_turn
            else
                @board[index] = @current_turn
                show_board
                check_for_winner
                change_turn
            end
    end

    private
    def check_for_winner
        if @board[0] == @board[4] && @board[4] == @board[8]
           @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[2] == @board[4] && @board[4] == @board[6]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[0] == @board[1] && @board[1] == @board[2]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[3] == @board[4] && @board[4] == @board[5]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[6] == @board[7] && @board[7] == @board[8]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[0] == @board[3] && @board[3] == @board[6]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[1] == @board[4] && @board[4] == @board[7]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        elsif @board[2] == @board[5] && @board[5] == @board[8]
            @game_over = true
            puts "Three in a row! #{@current_turn} has won!"
        else
            @game_over = false
        end
    end

end

#Pseudocode

# winners = [[0, 4, 8], [2, 4, 6], [0, 1, 2], [3, 4, 5],
#             [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

# x = Board.new
# initializes "X" and "O" and board
# x.player_move(4)
# places X in middle square
# x.player_move(0)
# places O in first square
# x.player_move(3)
# places O middle left square
# y.player_move(4)
# "Space is already taken"
# x.player_move(5)
# Three in a row "X" wins!


