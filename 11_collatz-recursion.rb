# Find how many steps to get to 1 from the given number (n)
# If n is even, divide it by 2
# Else, return 3n + 1

def collatz(n, steps=0)
    return steps if n == 1

    if n % 2 == 0
        collatz(n/2, steps+=1)
    else
        collatz(3*n+1, steps+=1)
    end
end

pp collatz 3