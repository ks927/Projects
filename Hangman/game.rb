class Game
    
    def initialize 
        @game_over = false
        @guesses = 10
        generate_word
    end
    
    def generate_word
        good_words = []
        File.readlines('dictionary.txt').each do |word| 
            if word.length >= 5 && word.length <= 12
            good_words << word
            end
        end
        @secret_word = good_words.sample.strip.downcase
        @letters = @secret_word.split('').to_s
        
    end

    def play
        while @game_over == false            
            # prompt user for guesses
            print "Guess a letter"
            @guess = gets.chomp.downcase
            if @letters.include?@guess
                puts "You got one!"
            else
                puts "Nice try but guess again!"
                @guesses = @guesses -= 1
                check_end_game
            end
        end
        
    end
    
    def check_end_game
        if @guesses == 0
            game_over = true
            print "Game over you lose!"
            puts "The secret word was #{@secret_word}!"
        end
        
    end
    
end


# Prompt user to play and start game based on response
print "Would you like to play Hangman? [Y/N]"
case gets.chomp.upcase
    when "Y" then Game.new.play
    when "N" then puts "Fine then, maybe another time"
end
    

