module Display

    def welcome_screen
        "Welcome to my Game of Tic Tac Toe \nThe Rules are simple... You know the rules"
    end

    def player_name_selection(number)
        "Player ##{number}... What is your name"
    end

    def player_symbol_selection
        "Select your Symbol..."
    end

    def duplicate_symbol(duplicate_symbol)
        "But it can not be #{duplicate_symbol}"
    end

    def invalid_symbol
        "Same Symbol chosen... Retry the Process"
    end

    def display_start_of_game
        "The Game Starts now "
    end
end
