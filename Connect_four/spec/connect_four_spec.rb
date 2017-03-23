require 'connect_four'

describe Game do
    
    before(:all)do
        @player = Game.new
    end
    
    describe ".initialize" do
        it "sets current turn to R" do
            expect(@player.current_turn).to eql("R")
        end
        
        it "does not raise an error message" do
            expect{Game.new}.to_not raise_error
        end
        
        it "sets game over flag variable" do
           expect(@player.game_over).to be false 
        end
    end
    
    describe ".place_piece" do
        it "takes player input and places player in corresponding column" do
            column = 1
            expect(@player.board[5][6]).to eq("R")
        end
        
    end
        
    
        
    
    
    
    
end
