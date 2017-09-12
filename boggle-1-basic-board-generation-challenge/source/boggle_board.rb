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
      # removes first 4 letters from array and adds them to output_string
      output_string << letter_array.shift(4).join(' ') + "\n"
    end

    output_string
  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s

    # # a new string for the output
    # output_string = String.new
    #
    #
    # #make a variable so we don't mess up instance variable
    # # use .shuffle to randomise the order of elements in the array
    # letter_array = @alphabet.shuffle
    #
    #
    # 4.times do
    #   # removes first 4 letters from array and adds them to output_string
    #   output_string << letter_array.shift(4).join(' ') + "\n"
    # end


    # output_string


    #############

    shake!

  end
end


puts BoggleBoard.new
