class Hangman


    def initialize
      #added @ to make instance variable to use in other places.
      @letters = ('a'..'z').to_a
      @word = words.sample
      @lives = 7
      @word_teaser = ""
  

            @word.first.size.times do
         @word_teaser += "_ "
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
      update_teaser(last_guess) unless last_guess.nil?
      puts @word_teaser
    end

    def update_teaser last_guess

      new_teaser = @word_teaser.split

      new_teaser.each_with_index do |letter, index |
        #replace blank values with letter if it matches in word
        if letter == "_" && @word.first[index] == last_guess
          new_teaser[index] = last_guess
        end
      end

      @word_teaser = new_teaser.join(" ")
    end

    def make_guess
      if @lives > 0
      puts "Enter a Letter"
      guess = gets.chomp

      #if letters is not part of the word remove from the array
      good_guess = @word.first.include? guess

      if guess == "exit"
        puts "Thank you for playing"
      elsif good_guess
        puts "You are correct!"

        print_teaser guess

        if @word.first == @word_teaser.split.join
          puts "Congratualtions... You have won the game"
        else

        make_guess
        end
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
      puts "To exit game at any pont type 'exit'"
      print_teaser

      puts "Clue: #{@word.last}"

      make_guess

      puts "You Guessed #{guess}"
    end


  end

  game = Hangman.new
  game.begin