class Game
    
    def initialize 
        @game_over = false
        @guesses = 10
        @correct_guesses = []
        @incorrect_guesses = []
        generate_word
    end
    # load dictionary and generate random word between 5 and 12 characters
    def generate_word
        good_words = []
        File.readlines('dictionary.txt').each do |word| 
            if word.length >= 5 && word.length <= 12
            good_words << word
            end
        end
        @secret_word = good_words.sample.strip.downcase
        @letters = @secret_word.split('') # separate letters
        @blanks = Array.new(@secret_word.length, '_') # create blanks to fill in
    end
    # check for existence and load game with play method
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
    # save game to saved directory
    def save_game
        puts "Enter name for your game: "
        name = gets.chomp
        File.open("saved/#{name}", 'w').puts Marshal.dump(self)
        puts "Game saved!"
        Process.exit
    end
    # prompt user for guesses and check for matches
    def check_guess
        print "Guess a letter or type 'save' to save game "
            @guess = gets.chomp.downcase
            if @letters.include?@guess
                puts "You got one!"
                @letters.each_with_index do |letter, index|
                    @blanks[index] = letter if letter == @guess
                end
            elsif @guess == "save"
                save_game
            else
                puts "Nice try but guess again!"
                @incorrect_guesses << @guess
                @guesses = @guesses -= 1
            end
    end
    # show the updated blanks after each turn
    def display
       @blanks.each { |letter| print "#{letter} " } 
    end
    # the game loop with all the methods
    def play
        until @game_over == true
                check_guess
                display
                check_end_game
                puts "#{@correct_guesses}"
                puts "#{@incorrect_guesses} You have #{@guesses} guesses left!"
        end    
    end
    # if guesses run out or blanks get filled in, game_over is set to true, ending the game
    def check_end_game
        if @guesses == 0
            @game_over = true
            print "Game over, you lose!"
            puts "The secret word was #{@secret_word}!"
        elsif @blanks.none? { |letter| letter == '_' }  
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
        puts "Didn't catch that, try again"
end
    

