# Find the heaviest rock by separating each two rocks and picking the heaviest one until no rocks left to compare 

def find_heaviest(rocks_arr)

    # Base case: if there are only two values or fewer return the largest one

    if rocks_arr.length <= 2
        a = rocks_arr[0]
        b = rocks_arr[-1]

    # If there are more than two values split the array and invoke the method again

    else
        a = find_heaviest(
            rocks_arr.slice!(0, rocks_arr.length/2)
        )
        b = find_heaviest(rocks_arr)
    end

    a > b ? a : b
end

rocks = 10.times.map{rand(100) + 1}

pp rocks

pp find_heaviest(rocks)

