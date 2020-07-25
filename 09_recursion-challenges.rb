# Append array with a number and all the numbers before it (decreasing to 0)

def append(arr, n)
    # Base case: return the arr when it's less than 0
    return arr if n < 0

    # The basic  operation
    arr << n
    append(arr, n-1)
end

# pp append [], 5


# Reverse append

def reverse_append(arr, n)
    return arr if n < 0

    arr << 0 + arr.length

    reverse_append(arr, n-1)
end

# pp reverse_append [], -1
# pp reverse_append [], 1


# Fibbonaci

def fib2(n)
    a = 0
    b = 1

    while n > 1
        c = a + b
        a = b
        b = c
        n -= 1
    end

    return b
end

pp fib2 10

def fib(n)
    return 0 if n == 0
    return 1 if n == 1
    fib(n-1) + fib(n-2)
end

pp fib 10



