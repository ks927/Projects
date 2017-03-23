class Game
    attr_reader :current_turn, :board
    
    def initialize
        @current_turn = "R"
        @board = [
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(_ _ _ _ _ _ _),
      %w(1 2 3 4 5 6 7)]
        @game_over = false
        show_board
        play 
    end
    
    def change_turn
       @current_turn = @current_turn == "R" ? "Y" : "R" 
    end
    
    def play
      until @game_over == true
        place_piece
        change_turn
        show_board
      end
    end
    
    def place_piece
       puts "pick a column to drop your piece"
        column = gets.chomp.to_i
        check_move?(column)
    end
    
    def show_board
      @board.each do |row|
          puts ' ' + row.join(' ')
      end
    end
    
    def check_move?(move)
       if (move.between?(1, 7) && @board[0][move-1] == "_")
         true 
         index = 6 
          while @board[index][move-1] != "_"
            index -=1
          end
           @board[index][move-1] = @current_turn
        else
           puts "Invalid move, try again"
           !change_turn
       end
    end
    
end

# @board[row][column]
# index = 0 
# while @board[index][column-1] != "_"
#  index += 1
# end
# @board[5-1][column-1]