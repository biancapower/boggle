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

    i = 0
    while i < 16
      @die_face << @dice[i].split('').sample(1)
      i = i + 1
    end

    letter_array = @die_face.shuffle

    4.times do
      output_string << letter_array.shift(4).join('  ') + " \n"
      output_string.gsub!('Q ','Qu')
    end

    puts output_string

    no_spaces_string = output_string.delete(' ').delete("\n")

    # puts "no spaces: " + no_spaces_string


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

    ########################################

    # WORKS FOR WORDS HORIZONTALLY LEFT TO RIGHT

    guess = ""

    valid_words = Array.new()
    not_valid_words = Array.new()

    while guess != "DONE"

      puts "\n Enter a word, or type DONE to end game: "

      guess = gets.chomp.upcase

      if no_spaces_string[0..3].include?(guess) || no_spaces_string[4..7].include?(guess) || no_spaces_string[8..11].include?(guess) || no_spaces_string[12..15].include?(guess)

        valid_words << guess
        # puts "valid"

      else

        not_valid_words << guess
        # puts "invalid"

      end

    end

    puts "Your valid words include: " + valid_words.to_s

    # [0..-2] to remove "done" from array
    puts "Your INvalid words include: " + not_valid_words[0..-2].to_s # FIXME: will miss a word if "done" is a valid word (therefore ending up in valid_words)

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
