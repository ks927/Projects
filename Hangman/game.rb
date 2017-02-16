class Game
    
    def initialize 
        @game_over = false
        @guesses = 10
        @correct_guesses = []
        @incorrect_guesses = []
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
    
    def load_game
        puts "What is the name of your game?"
        name = gets.chomp
        if File.exist?("saved/#{name}")
            loaded_game = Marshal.load(File.open("saved/#{name}", 'r'))
            loaded_game.play
        else
            puts "No game with that name found"
            return
        end
            
    end
    
    def save_game
        puts "Enter name for your game: "
        name = gets.chomp
        File.open("saved/#{name}", 'w').puts Marshal.dump(self)
        puts "Game saved!"
        Process.exit
    end
    
    def check_guess
        # prompt user for guesses
            print "Guess a letter or type 'save' to save game "
            @guess = gets.chomp.downcase
            if @letters.include?@guess
                @correct_guesses << @guess
                puts "You got one!"
            else
                puts "Nice try but guess again!"
                @incorrect_guesses << @guess
                @guesses = @guesses -= 1
            end
        
    end

    def play
        until @game_over == true
            if @guess == "save"
                save_game
            else
                check_guess
                check_end_game
                puts "#{@correct_guesses}"
                puts "#{@incorrect_guesses} You have #{@guesses} guesses left!"
            end
        end    
    end
    
    def check_end_game
        if @guesses == 0
            @game_over = true
            print "Game over, you lose!"
            puts "The secret word was #{@secret_word}!"
        elsif @correct_guesses == @secret_word  
                @game_over = true
                print "You win!"
                puts "The secret word is #{@secret_word}"
        end
        
    end
    
end


# Prompt user to play and start game based on response
print "Would you like to play Hangman? [Y]es [N]o [L]oad saved game"
case gets.chomp.upcase
    when "Y" then Game.new.play
    when "L" then Game.new.load_game
    when "N" then puts "Fine then, maybe another time"
        else
        puts "not sure"
end
    

