require_relative 'display.rb'

class Game

    attr_accessor :rounds
    
    include Display
    def initialize
        @board = Board.new
        @player_one = nil
        @player_two = nil
        @rounds = 0
    end

    public
    def play
        setup_game
    end

    private
    def setup_game
        puts welcome_screen
        create_all_players
    end
    
    def create_all_players
        @player_one = create_player(1)
        @player_two = create_player(2, @player_one.symbol)
    end

    def create_player(number, first_symbol = nil)
        puts player_name_selection(number)
        name = gets.chomp
        puts player_symbol_selection
        puts duplicate_symbol(first_symbol) if first_symbol != nil;
        symbol = gets.chomp
        if symbol == first_symbol
            puts invalid_symbol
            create_player
        else
            return Player.new(name, symbol)
        end
    end



end