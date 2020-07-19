def factorial(n)
    return 1 if n < 2

    n + factorial(n-1)
end

# pp factorial(0)


def palindrome(str)    
    palindrome(str[1..-2]) if str.length > 2

    str[0] == str[-1] ? true : false
end

# pp palindrome('mala')


def beer_bottles(n)
    return "no more bottles of beer on the wall" if n == 0

    "#{n} bottles of beer on the wall \n" + beer_bottles(n-1)
end

# puts beer_bottles(3)


def recursive_flatten(arr)
    result = []

    if arr.class == Array
        arr.each do |el|
            if el.class == Array
                result = result + recursive_flatten(el)
            else
                result << el
            end
        end
    end

    result
end

# pp recursive_flatten([[1, 7, [8, 9]], [3, 4]])


def to_roman(n, result="")
    roman_mapping = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
    }

    roman_mapping.keys.each do |k|
        if n-k >= 0
            n = n-k
            result += roman_mapping[k]
            to_roman(n, result)
        end
    end

    return result if n == 0
end

# pp to_roman(1995)


def to_integer(str, result=0)
    roman_mapping = {
        "M" => 1000,
        "CM" => 900,
        "D" => 500,
        "CD" => 400,
        "C" => 100,
        "XC" => 90,
        "L" => 50,
        "XL" => 40,
        "X" => 10,
        "IX" => 9,
        "V" => 5,
        "IV" => 4,
        "I" => 1
    }

    roman_mapping.keys.each do |k|
        if k.length == 2 && k == str[0..1]
            result += roman_mapping[k]
            str = str[2..-1]
        elsif k.length == 1 && k == str[0]
            result += roman_mapping[k]
            str = str[1..-1]
        end
    end

    result if str.length < 1
end

pp to_integer "MCM"