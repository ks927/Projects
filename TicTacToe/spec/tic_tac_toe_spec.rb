require "tictactoe"

describe Board do

    before(:all) do
        @game = Board.new
    end

        describe ".player_move" do
            it "sets the X or O at the proper place on the board" do
                @game.player_move(8)
                expect(@game.board[8]). to eq("X")
            end

            it "changes turn" do
                expect(@game.current_turn).to eql("O")
            end


            it "sets game over to true when X or O are in 3 consecutive spots" do
               @game.player_move(0)
                @game.player_move(5)
                @game.player_move(1)
                @game.player_move(6)
                @game.player_move(2)
                expect(@game.game_over).to be true
            end

        end






end
