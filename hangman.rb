class Hangman


    def initialize
      #added @ to make instance variable to use in other places.
      @letters = ('a'..'z').to_a
      @word = words.sample
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

    def begin
      #ask user for a letter
      puts "New game has started...Your word is #{words.last.size} characters long"
      word_teaser = ""

      @word.first.size.times do
        word_teaser += "_ "
      end

      puts

      puts "Clue: #{@word.last}"
      puts "Enter a Letter"
      guess = gets.chomp

      puts "You Guessed #{guess}"
    end


  end

  game = Hangman.new
  game.begin