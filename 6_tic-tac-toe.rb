class Board
    attr_accessor :board
    attr_accessor :count
    attr_accessor :last_player

    def initialize
        @moves = []
        @count = 0
        @board = [
            ["", "", ""],
            ["", "", ""],
            ["", "", ""]
        ]
        @last_player = ''
    end

    
    private

    def check_horizontal?(board = @board)
        for i in 0..2 
            if board[i].all? {|symbol| symbol == 'X'} || board[i].all? {|symbol| symbol == 'O'}
                return true
            end
        end

        return false
    end

    def check_vertical?
        transposed = @board.transpose

        return check_horizontal?(transposed)
    end

    def check_diagonal?
        return true if (
            [@board[0][0], @board[1][1], @board[2][2]].all? {|symbol| symbol == 'X'}
        ) || (
            [@board[0][0], @board[1][1], @board[2][2]].all? {|symbol| symbol == 'O'}
        ) || (
            [@board[0][2], @board[1][1], @board[2][0]].all? {|symbol| symbol == 'X'}
        ) || (
            [@board[0][2], @board[1][1], @board[2][0]].all? {|symbol| symbol == 'O'}
        )
    end

    
    public

    def move?(i, j, player)
        # pp valid_move?([i , j])
        if @board[i][j].length > 0
            return false
        else
            @moves << [i, j, player]
            @moves.each do |m|    
                @board[m[0]][m[1]] = m[2]
            end
        end

        @count += 1
        @last_player = player
        true
    end

    def check_win?
        return true if check_horizontal? || check_vertical? || check_diagonal?
    end
end

tic = Board.new()

while tic.count < 9
    if tic.count % 2 == 0
        player = 'X'
    else
        player = 'O'
    end

    puts ""
    puts "It's #{player} turn. Where's your next move?"
    
    correct_input_i = false

    while !correct_input_i do
        puts ""
        puts "i:"
        i = gets.chomp.to_i

        if i >= 0 && i <= 2
            correct_input_i = true
        else
            puts ""
            puts "You can only input 0-2"
        end
    end

    correct_input_j = false

    while !correct_input_j do
        puts ""
        puts "j:"
        j = gets.chomp.to_i

        if j >= 0 && j <= 2
            correct_input_j = true
        else
            puts ""
            puts "You can only input 0-2"
        end
    end

    if tic.move?(i, j, player) == false
        puts ""
        puts "Invalid move! Please pick another location"
        next
    else
        tic.move?(i, j, player)
    end

    puts ""
    pp tic.board
    
    if tic.check_win?
        puts ""
        puts "#{tic.last_player} WINS!"
        break
    end
end