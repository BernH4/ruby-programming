class Node
    attr_accessor :position, :adjacents

    def initialize(y_position, x_position, board)
        @position = [y_position, x_position]
        @adjacents = generate_adjacents(board)
    end

    def generate_adjacents(board)
        adjacents = []

        # Next: generate every L-moves possible
    end
end

class Chess
    attr_accessor :board, :knight_root

    def initialize(n)
        @board = generate_board_knight(n-1)
        @knight_root
    end

    def generate_board_knight(n)
        board = []

        y_position = rand(0..n)
        x_position = rand(0..n)

        for i in 0..n
            arr = []

            for j in 0..n
                if i == y_position && j == x_position
                    arr << 'K'
                else
                    arr << ' '
                end
            end

            board << arr
        end

        @knight_root = Node.new(y_position, x_position, board)

        board
    end
end

chess = Chess.new(8)
knight_root = chess.board

pp chess.board
pp chess.knight_root