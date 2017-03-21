require "tictactoe"

describe Board do
<<<<<<< HEAD

    before(:all) do
        @game = Board.new
    end

=======

    before(:all) do
        @game = Board.new
    end

>>>>>>> origin/master
        describe ".player_move" do
            it "sets the X or O at the proper place on the board" do
                @game.player_move(8)
                expect(@game.board[8]). to eq("X")
            end
<<<<<<< HEAD

=======

>>>>>>> origin/master
            it "changes turn" do
                expect(@game.current_turn).to eql("O")
            end

<<<<<<< HEAD

=======

>>>>>>> origin/master
            it "sets game over to true when X or O are in 3 consecutive spots" do
               @game.player_move(0)
                @game.player_move(5)
                @game.player_move(1)
                @game.player_move(6)
                @game.player_move(2)
                expect(@game.game_over).to be true
            end
<<<<<<< HEAD

        end






end
=======

        end






end
>>>>>>> origin/master
