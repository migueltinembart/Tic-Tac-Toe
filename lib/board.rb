require 'pry'

class Board

    attr_reader :cells

    #save all combinations in an array and make unchangeable with freeze
    POSSIBLE_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8],
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,8] 
    ].freeze

    def initialize
        @cells = [1,2,3,4,5,6,7,8,9]
    end
    
    # display the board with format
    def show
        puts <<-HEREDOC
    
           #{cells[0]} | #{cells[1]} | #{cells[2]}
          ---+---+---
           #{cells[3]} | #{cells[4]} | #{cells[5]}
          ---+---+---
           #{cells[6]} | #{cells[7]} | #{cells[8]}
    
        HEREDOC
    end
    
    # substitute cell number with symbol
    def change_cell(number, symbol)
        @cells[number -1] = symbol
    end

    # if input is outside of range 1-9 return false
    def is_valid_move?(number)
        @cells[number -1] == number
    end

    # if all cells are filled return true
    def filled?
        @cells.all? { |cell| cell =~ /[^0-9]/ }
    end

    # return true if any of the combinations has a unique length of 1
    # uniq takes all same items inside of array and reduces is to 1 item
    # means if inside of 1 combo there are 3 same symbols it returns 1
    # |combo| is every subarray inside of POSSIBLE_COMBINATIONS
    def game_over?
        POSSIBLE_COMBINATIONS.any? do |combo|
            [cells[combo[0]], cells[combo[1]], cells[combo[2]]].uniq.length == 1
        end
    end
end