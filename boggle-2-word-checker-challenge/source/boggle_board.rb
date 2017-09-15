# You should re-use and modify your old BoggleBoard class
# to support the new requirements

class BoggleBoard
  def initialize
    #how do we describe it

    #creates an array of 16 underscores
    @spaces = Array.new(16, "_")


    #creates an array with letters A-Z
    @alphabet = Array.new()

    ("A".."Z").map do |letter|
      @alphabet.push(letter)
    end


    #array of valid boggle dice
    @dice = Array.new([
      "AAEEGN",
      "ELRTTY",
      "AOOTTW",
      "ABBJOO",
      "EHRTVW",
      "CIMOTU",
      "DISTTY",
      "EIOSST",
      "DELRVY",
      "ACHOPS",
      "HIMNQU",
      "EEINSU",
      "EEGHNW",
      "AFFKPS",
      "HLNNRZ",
      "DEILRX"
      ])



  end


#what does it do?
#  shake! should modify the board, filling each cell with a random upper-case letter A-Z.

  def shake!
    output_string = String.new

    @die_face = Array.new()

    @line_1 = Array.new()
    @line_2 = Array.new()
    @line_3 = Array.new()
    @line_4 = Array.new()

    @boggle_board = Array.new()

    i = 0
    while i < 16
      @die_face << @dice[i].split('').sample(1)
      i = i + 1
    end

    letter_array = @die_face.shuffle

    4.times do
      output_string << letter_array.shift(4).join('  ') + " \n"
      # output_string.gsub!('Q ','Qu') #FIXME: fix Q a different way
    end

    # prints out shaken boggle board
    puts output_string


    # create a string without spaces or newline characters
    # no_spaces_string = output_string.delete(' ').delete("\n")

    lines = output_string.delete(' ').delete("\n").split('')

    @line_1 = lines[0..3]
    @line_2 = lines[4..7]
    @line_3 = lines[8..11]
    @line_4 = lines[12..15]

    # array of arrays
    @boggle_board = [@line_1, @line_2, @line_3, @line_4]


    guess = " "
    @matches = Array.new()
    @all_matches = Array.new()
    @coordinates = Array.new()
    @word = ""

    ######################START######################

    # while guess != ""

      puts "\n Enter a word, or press ENTER to end game: "

      guess = gets.chomp.upcase

      l = 0
      while l < guess.length

        @matches = []

        x = 0
        while x < 4
          y = 0
          while y < 4

            if @boggle_board[x][y] == guess[l]

                # create a 3 level deep array, e.g.:
                # [
                #   [[0][1], [2][0], [][]], #<- location of matches for guess[0]
                #   [[0][2], [1][1]]  #<- location of matches for guess[1]
                # ]

              @coordinates = [x, y]

              @matches << @coordinates


            end

            y = y + 1
          end
          x = x + 1
        end

        @all_matches << @matches
        l = l + 1

      end
    # end


    ######################END######################


    print @all_matches




    # search touching squares for second letter of guess
      # touching coordinates are (where resulting coordinate >= 0):
        # [x + 1, y]
        # [x - 1, y]
        # [x, y + 1]
        # [x, y - 1]
        # [x + 1, y + 1]
        # [x + 1, y - 1]
        # [x - 1, y + 1]
        # [x - 1, y - 1]
    # repeat for remaining letters of word
      # make sure no letter is used twice (i.e. can't go back over a letter that has already been used)





    ########################################

    # get guess from user
    # if output_string includes guess
      # add guess to "valid_words" array
    # elsif output_string doesn't include guess
      # add guess to "not_valid_words" array

    # HOW TO TELL IF output_string INCLUDES guess #
      # (simple version, horizontally only) if one line of output_string, either forward or reversed, contains the guess
        # OR CHECK GUESS REVERSED
      # (also vertically) create substrings to represent vertical lines, and same as above

      #GRID

    ########################################


    # guess = ""
    #
    # valid_words = Array.new()
    # not_valid_words = Array.new()
    #
    # while guess != "DONE"
    #
    #   puts "\n Enter a word, or type DONE to end game: "
    #
    #   guess = gets.chomp.upcase
    #
    #   # WORKS FOR WORDS HORIZONTALLY LEFT TO RIGHT OR REVERSED
    #   if no_spaces_string[0..3].include?(guess) || no_spaces_string[4..7].include?(guess) || no_spaces_string[8..11].include?(guess) || no_spaces_string[12..15].include?(guess) || no_spaces_string[0..3].include?(guess.reverse) || no_spaces_string[4..7].include?(guess.reverse) || no_spaces_string[8..11].include?(guess.reverse) || no_spaces_string[12..15].include?(guess.reverse)
    #
    #     valid_words << guess
    #     # puts "valid"
    #
    #   else
    #
    #     not_valid_words << guess
    #     # puts "invalid"
    #
    #   end
    #
    # end
    #
    # puts "Your valid words include: " + valid_words.to_s
    #
    # # [0..-2] to remove "done" from array
    # puts "These words were not on the board: " + not_valid_words[0..-2].to_s # FIXME: will miss a word if "done" is a valid word (therefore ending up in valid_words)

  end



  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s

    # a new string for the output
    output_string = String.new


    #make a variable so we don't mess up instance variable
    # use .shuffle to randomise the order of elements in the array
    letter_array = @spaces.shuffle


    4.times do
      # removes first 4 letters from array and adds them to output_string
      output_string << letter_array.shift(4).join(' ') + "\n"
    end

    # remove last "\n"
    output_string = output_string[0..-2]

    output_string


  end
end


my_board = BoggleBoard.new

puts "Welcome to BOGGLE!"

my_board.shake!
