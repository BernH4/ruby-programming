# "What a string!" ->  "Bmfy f xywnsl!"

=begin

Getting the patterns right:

- a -> bcde -> f
- W -> xyza -> B
- h -> ijkl -> m

So, every letter is replaced by n letters after that.

Algorithms:

- Create a dictionary of letters from a-z + n more letters
- Create a temp variable filled with an empty string

- Loop each ltr in inputted words
    - Create a temp2 variable filled with an empty string

    - Loop each index d in dictionary
        - If ltr is equal to dictionary[d]
            - Assign temp with dictionary[d + n]
        - Else if ltr is equal to uppercase of dictionary[d]
            - Assign temp with uppercase of dictionary[d + n]
        - Else
            - Assign temp with ltr
    
    - Add temp2 to temp

- Return temp
    
=end

def caesar_cipher(str, n)
    dict = 'abcdefghijklmnopqrstuvwxyz'

    for i in 0..n
        dict += dict[i]
    end

    temp = ''

    for s in 0..str.length-1
        temp2 = str[s]

        for d in 0..dict.length-1
            if str[s] == dict[d]
                temp2 = dict[d+5]
            elsif str[s] == dict[d].upcase
                temp2 = dict[d+5].upcase
            end
        end

        temp += temp2
    end

    temp
end

pp caesar_cipher("What a string!", 5)