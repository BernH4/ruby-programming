
# Function to merge both arrays that have been splitted in two

def merge(left, right, total_len)
    result = []

    while result.length < total_len

        # Handle when one of the arrays is depleted, push whatever is left to result

        if left.length == 0 || right.length == 0
            result += left if left.length > 0
            result += right if right.length > 0
            break
        end

        # Compare every first element of left and right, if left is smaller than right then push it to result and reassign array left with the rest of the elements
        # Do the same for array right

        if left[0] < right[0]
            result << left[0]
            left = left[1..-1]
        else
            result << right[0]
            right = right[1..-1]
        end
    end

    result
end

# pp merge([2, 6], [8, 9, 10], 5)


# Function to do merge sort

def merge_sort(arr)

    # pp arr

    # Base case when arr's length is only 1

    len = arr.length
    return arr if len < 2

    # Find mid index and split array into two

    mid = (len.to_f/2).round - 1
    left = arr[0..mid]
    right = arr[mid+1..len-1]

    # Switch left with right if left is bigger

    if left[0] > right[0]
        temp = left
        left = right
        right = temp
    end

    # Recursion until every chunk has been sorted

    left = merge_sort(left)
    right = merge_sort(right)

    # Merge each half into whole

    total_len = left.length + right.length
    merge(left, right, total_len)
end

pp merge_sort([9, 8, 10, 6])