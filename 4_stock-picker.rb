=begin
    
- Loop i through array input
    - Loop from j=i+1 through array input 
        - If arr[i] < arr[j]
            - Set arr[j] - arr[i] as a hash key and set [arr[i], arr[j]] as its value

- Loop through created hash and get the highest number
    
=end

def stock_picker(arr)
    margins = {}

    for i in 0..arr.length-1
        for j in i+1..arr.length-1
            if arr[i] < arr[j]
                margins[arr[j] - arr[i]] = [i, j]
            end
        end
    end

    highest_margin = margins.keys.sort_by { |key| -key }[0]

    margins[highest_margin]
end

pp stock_picker([17,3,6,9,15,8,6,1,10])