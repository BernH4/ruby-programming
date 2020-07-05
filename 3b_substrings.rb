=begin
    
Refactored based on other's solution

- Store a new hash (0) to (result)
- Replace every punctuation with space and split and store them to (splitted_by_space)

- Loop each spl in splitted_by_space
    - Loop each dict in dictionary
        - Does the inputted word includes the word in dictionary? If yes then add 1 to result[word]
    
=end

def substrings(string, dictionary)
    result = Hash.new(0)
    splitted_by_space = string.downcase.gsub(/\p{Punct}/, " ").split

    splitted_by_space.each do |spl|
        dictionary.each do |dict|
            if spl.include? dict
                result[dict] += 1
            end
        end
    end

    return result
end
    

dictionary = ['how', 'sit', 'it']

p substrings("Howdy partner, sit down! How's it going? git", dictionary)
