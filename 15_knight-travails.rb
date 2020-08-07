class Node
    attr_accessor :position, :pos_moves

    def initialize(pos, parent = nil)
        @position = generate_position(pos)
        @pos_moves = generate_pos_moves(pos)
    end

    def generate_position(pos)
        position = nil
        y_position, x_position = pos

        if y_position >= 0 && y_position <= 7 && x_position >= 0 && y_position <= 7
            position = [y_position, x_position]
        end

        position
    end

    def generate_pos_moves(pos)
        y_position, x_position = pos

        pos_moves = [
            generate_position([y_position - 2, x_position + 1]),
            generate_position([y_position - 2, x_position - 1]),
            generate_position([y_position - 1, x_position + 2]),
            generate_position([y_position - 1, x_position - 2]),
            generate_position([y_position + 2, x_position - 1]),
            generate_position([y_position + 2, x_position + 1]),
            generate_position([y_position + 1, x_position - 2]),
            generate_position([y_position + 1, x_position + 2])
        ].select {|pos| pos != nil}

        # Generate every L-moves possible
        # y-2 x+1
        # y-2 x-1
        # y-1 x+2
        # y-1 x-2
        # y+2 x-1
        # y+2 x+1
        # y+1 x-2
        # y+1 x+2

    end
end

class Chess
    attr_accessor :board, :knight_root

    def initialize
        @knight_root = generate_root
        @board = generate_board
        print_pos_moves
    end

    def generate_root
        y_position = rand(0..7)
        x_position = rand(0..7)

        Node.new([y_position, x_position])
    end


    def generate_board
        board = []

        for i in 0..7
            arr = []
            y_position, x_position = @knight_root.position

            for j in 0..7
                if i == y_position && j == x_position
                    arr << 'K'
                else
                    arr << ' '
                end
            end

            board << arr
        end

        board
    end

    def print_pos_moves
        for pos in @knight_root.pos_moves
            y, x = pos
            @board[y][x] = 'P'
        end
    end
end

chess = Chess.new
knight_root = chess.board

pp chess.board
pp chess.knight_root