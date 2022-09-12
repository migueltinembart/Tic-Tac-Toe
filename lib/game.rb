require_relative 'display.rb'
require 'highline'

class Game

    attr_accessor :rounds
    attr_reader :player_one, :player_two, :current_player, :board
    
    include Display
    def initialize
        @board = Board.new
        @player_one = nil
        @player_two = nil
        @current_player = nil
        @rounds = 1
    end

    public
    def play
        setup_game
        board.show
        play_rounds
        who_won?
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
            create_player(number, symbol)
        else
            return Player.new(name, symbol)
        end
    end

    def player_input(symbol)
        puts your_turn(symbol)
        number = gets.chomp.to_i
        return number if board.is_valid_move?(number)

        puts invalid_input
        player_input(symbol)
    end

    def play_rounds
        @current_player = player_one
        until board.filled?
            cell = player_input(current_player.symbol)
            board.change_cell(cell, current_player.symbol)
            board.show

            break if board.game_over?

            @current_player = switch_player
        end
    end

    def switch_player
        return player_one if current_player == player_two
        return player_two if current_player == player_one
    end

    def who_won?
        if board.game_over?
            puts declare_winner(current_player.name)
        else         
            puts tie
        end
        retry_game_prompt
    end

    def retry_game_prompt
        if HighLine.agree("Would you like to play again ") 
            play
        else
            exit!
        end
    end

    
        
end