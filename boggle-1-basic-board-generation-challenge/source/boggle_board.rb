class BoggleBoard
  def initialize
    #how do we describe it

    #creates an array of 16 underscores
    @spaces = Array.new(16, "_")




  end

#what does it do?
#  shake! should modify the board, filling each cell with a random upper-case letter A-Z.

  def shake!

  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s
    # @spaces.each do |space|
    #   print space
    # end

    # @spaces.join


    # a new string for the output
    output_string = String.new

    #make a variable so we don't mess up instance variable
    letter_array = @spaces


    4.times do
      # removes first 4 letters from array and adds them to output_string
      output_string << letter_array.shift(4).join('') + "\n"
    end


    # j = 0
    # while j < 4
    #
    #   i = 0
    #
    #   while i < 4
    #
    #     output_string = output_string + letter_array[i]
    #
    #     i = i + 1
    #   end
    #
    #
    #   output_string = output_string + "\n"
    #
    #   j = j + 1
    #
    # end

    puts output_string

  end
end


puts BoggleBoard.new





############################################

# def shake!
#   puts "Welcome to BOGGLE!"
#
# # CREATE BLANK BOARD
#   puts "-"*4
#   puts "-"*4
#   puts "-"*4
#   puts "-"*4
#
#
#
# end
#
# shake!
