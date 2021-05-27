class Hangman


    def initialize
      letters = ('a'..'z').to_a
      word = words.sample
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
    end


  end