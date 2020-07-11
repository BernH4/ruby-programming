"
Level: Easy

- Set an array ['R', 'G', 'B', 'Y', 'O', 'W', 'V', 'P'] which represents 8 colours
- The computer picks 4 random colours (no duplicate colours)
- The player gets 10 chances to guess the correct number
- The program evaluates the player's guess:
    - 1 point is given if the colours exist on the computer pick
    - 2 point is given if the colours exist and is on the right place

Example:

Computer pick => 'BRVO'
Player 1st guess => 'BVPW' => points: [2, 1]
Player 2nd guess => 'VBOY' => points: [1, 1, 1]
Player 3rd guess => 'BOVR' => points: [2, 2, 1, 1]
Player 4th guess => 'BROV' => points: [2, 2, 1, 1]
Player 5th guess => 'BRVO' => points: [2, 2, 2, 2]

PLAYER WINS!
"

class Mastermind
    attr_accessor :guesses, :attempts, :points, :colour_options, :code_length, :code

    def initialize(colour_options, code_length)
        @colour_options = colour_options
        @code_length = code_length
        @code = random_pick
        @guesses = []
        @attempts = 1
        @points = {}
    end

    
    private

    def random_pick
        @colour_options.shuffle[0..@code_length-1].join
    end


    public

    def guess(string)
        colour_option_not_available = false

        string.each_char do |s|
            if @colour_options.include?(s.upcase) == false
                colour_option_not_available = true
            end
        end

        string.split('').uniq.length == string.length ? is_duplicate = false : is_duplicate = true

        return false if (
            string.length != @code.length
        ) || (
            colour_option_not_available
        ) || (
            is_duplicate
        )
           
        count = string.length-1
        temp = Marshal.load(Marshal.dump(@code)).split('')

        @points = Hash.new(0)

        for i in 0..count
            if string[i].upcase == @code[i]
                @points[:all_correct] += 1
                temp -= [string[i].upcase]
            end
        end

        temp.each do |t|
            @points[:colour_exist] += 1 if string.upcase.include? t
        end

        return points
    end
end

game = Mastermind.new(['R', 'G', 'B', 'Y', 'O', 'W', 'V', 'P'], 4)

puts ""
puts "
Welcome to Mastermind! 

You can start guessing by inputting a string comprised of #{game.code_length} unique characters (no duplicate) from this array of colours: #{game.colour_options}.

Examples of correct inputs: rbgy / YOBR / bOGv

Examples of incorrect inputs: 
    rbgg    -> duplicate characters
    zuvp    -> z & u doesn't exist in the array of colours
    ybgow   -> length is longer than #{game.code_length}
"

while game.attempts <= 10 do
    puts ""
    puts "Colour options: #{game.colour_options}"
    puts "What's your guess ##{game.attempts}?"

    input = gets.chomp

    if game.guess(input) === false
        puts ""
        puts "Please input only 4 unique characters (no duplicate) from the available colours!"
        next
    else
        game.guess(input)
    end

    if (game.points[:all_correct] == 4)
        puts ""
        puts "Congratulations! You're a mastermind!"
        puts ""
        break
    end

    pp game.points

    game.attempts += 1
end

if game.attempts == 10
    puts ""
    puts "No attempts left. You lost! The correct answer is #{game.code}"
end
        