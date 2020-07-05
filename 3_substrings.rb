=begin
    
Algorithms:

- Create (result) -> an empty hash
- Create (splitted) -> an array of inputted words that have been splitted into each letter for each word

- Loop each word in dictionary
    - Loop each array in splitted
        - Loop each letter in each splitted array
            - If word[0] is equal to letter
                - Join the letters in array starting from the current letter to word.length-1
                - Compare the joined letters with word
                - If it's the same, check whether the key exists in (result)
                    - If it exists, add 1
                    - If not, assign 1 to result[word]
    
=end

def substrings(str, dict)
    result = {}
    splitted_by_space = str.split(' ')

    dict.each do |word1|
        splitted_by_space.each do |word2|
            for i in 0..word2.length-1
                if word1[0].downcase == word2[i].downcase
                    substr = word2[i..i+word1.length-1].downcase

                    if word1 == substr
                        if result[word1]
                            result[word1] += 1
                        else
                            result[word1] = 1
                        end
                    end
                end
            end
        end
    end

    result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

pp substrings("below", dictionary)

# { "below" => 1, "low" => 1 }

pp substrings("Howdy partner, sit down! How's it going?", dictionary)

# { "down" => 1, "how" => 2, "howdy" => 1,"go" => 1, "going" => 1, "it" => 2, "i" => 3, "own" => 1,"part" => 1,"partner" => 1,"sit" => 1 }