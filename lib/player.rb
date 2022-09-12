class Player
    attr_reader :name, :symbol

    @@players = {}
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end