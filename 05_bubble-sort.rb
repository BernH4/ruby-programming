=begin
    
Algorithms

- Set variable (swap) to true

- While (swap) is true
    - Set (swap) to false

    - Loop each i in arr
        - If arr[i] > arr[i+1]
            - Store arr[i] in a temp variable
            - Set arr[i] to arr[i+1]
            - Set arr[i+1] to temp

            - Set swap to true

=end

def bubble_sort(arr)
    swap = true

    while swap
        swap = false

        for i in 0..arr.length-2
            if arr[i] > arr[i+1]
                temp = arr[i]
                arr[i] = arr[i+1]
                arr[i+1] = temp

                swap = true
            end
        end
    end

    arr
end

pp bubble_sort([4,3,78,2,0,2])