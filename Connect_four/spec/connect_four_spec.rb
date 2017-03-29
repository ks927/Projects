require 'connect_four'

describe Game do

    before(:all)do
        @player = Game.new
    end    

    context "initialize" do
        it "sets current turn to R" do
            expect(@player.current_turn).to eql("R")
        end

        it "sets board to be an array" do
            expect(@player.board).to be_an_instance_of(Array)
        end

        it "sets game over flag variable" do
           expect(@player.game_over).to be false
        end
    end

#    describe ".check_move?" do
 #       it "takes player input and places player in corresponding column" do
  #          @player.check_move?(1)
   #         expect(@player.board[5][0]).to eq("R")
    #    end

#    end

 #   describe ".check_for_winner" do
  #      context "given four pieces in line horizontally" do
   #         it "sets game_over to true" do
    #            @player.check_move?(1)
     #           @player.check_move?(7)
      #          @player.check_move?(2)
       #         @player.check_move?(6)
        #        @player.check_move?(3)
         #       @player.check_move?(5)
          #      @player.check_move?(4)
           #     expect(@player.game_over).to be true
        #    end

    #    end
#    end



end
