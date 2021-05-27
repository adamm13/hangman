class Hangman


    def initialize
      #added @ to make instance variable to use in other places.
      @letters = ('a'..'z').to_a
      @word = words.sample
      @lives = 7
      @correct_guesses = []
      @word_teaser = ""
  

            @word.first.size.times do
        word_teaser += "_ "
      end
    end

    def words
      [
        ["cricket", "A game played by gentlemen.."],
        ["jogging", "Not walking is called.."],
        ["celebrate", "What you do on your birthday.."],
        ["computer", "What are you playing this on.."],
        ["exotic", "Not from around here"],
      ]
    end

    def print_teaser last_guess = nil
      update_teaser unless last_guess.nil?
      puts @word_teaser
    end

    def update_teaser last_guess

      new_teaser = @word_teaser.split

      new_teaser.each_with_index do |letter, index |
        #replace blank values with letter if it matches in word
        if letter == "_" && @word.first.split[index] == last_guess
          new_teaser[index] = last_guess
        end
      end
    end

    def make_guess
      if @lives > 0
      puts "Enter a Letter"
      guess = gets.chomp

      #if letters is not part of the word remove from the array
      good_guess = @word.first.include? guess

      if good_guess
        puts "You are correct!"

        @correct_guesses << guess

        #remove the guess form the array alphabet
        @letters.delete guess

        print_teaser guess
        make_guess
      else
        @lives -= 1
        puts "Sorry ...you have #{@lives} lives remaining. Try again"
        make_guess
      end
    else puts "Game over, Better luck next time"
    end
    end

    def begin
      #ask user for a letter
      puts "New game has started...Your word is #{words.last.size} characters long"
      print_teaser

      puts "Clue: #{@word.last}"

      make_guess

      puts "You Guessed #{guess}"
    end


  end

  game = Hangman.new
  game.begin