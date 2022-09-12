module Display

    def welcome_screen
        "Welcome to my Game of Tic Tac Toe \nThe Rules are simple... You know the rules\n"
    end

    def player_name_selection(number)
        "Player ##{number}... What is your name\n"
    end

    def player_symbol_selection
        "Select your Symbol...\n"
    end

    def duplicate_symbol(duplicate_symbol)
        "But it can not be #{duplicate_symbol}\n"
    end

    def invalid_symbol
        "Same Symbol chosen... Retry the Process"
    end

    def display_start_of_game
        "The Game Starts now "
    end

    def your_turn(symbol)
        "Place your Symbol #{symbol}"
    end

    def invalid_input
        "Invalid move... Must be between 1-9"
    end

    def tie
        "Nobody won"
    end

    def declare_winner(name)
        "Congratulations #{name}... You Won"
    end

    def clear_screen
        print "\e[2J\e[f"
    end


end
