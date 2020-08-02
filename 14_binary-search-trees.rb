class Node
    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root

    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(arr)
        arr = arr.sort.uniq
        mid = arr.length / 2

        root = Node.new(arr[mid]).data != nil ? Node.new(arr[mid]) : nil

        return root if arr.length <= 1

        root.left = build_tree(arr[0..mid-1])
        root.right = build_tree(arr[mid+1..arr.length-1])

        root
    end

    def pretty_print(node = @root, prefix="", is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? "│ " : " "}", false) if node.right
        puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data.to_s}"
        pretty_print(node.left, "#{prefix}#{is_left ? " " : "│ "}", true) if node.left
    end

    def insert(node = @root, n)
        return node.data if node.data == n

        if n < node.data
            if node.left === nil
                node.left = Node.new(n)
            else
                insert(node.left, n)
            end
        else
            if node.right === nil
                node.right = Node.new(n)
            else
                insert(node.right, n)
            end
        end
    end

    def delete(node = @root, n)
        return if node == nil

        if node.left && node.left.data == n
            child_node = node.left
            is_left_child_node = true

        elsif node.right && node.right.data == n
            child_node = node.right
            is_left_child_node = false
        end

        if child_node != nil
            if child_node.left == nil && child_node.right == nil
                child_node = nil      
            elsif child_node.left == nil
                if child_node.right == nil
                    node.left = nil
                else
                    child_node = child_node.right
                end
            elsif child_node.right == nil
                if child_node.left == nil
                    node.left = nil
                else
                    child_node = child_node.left
                end
            else
                child_node.data = child_node.left.data
                child_node.left = nil
            end
        else
            delete(node.left, n)
            delete(node.right, n)
        end

        if [true, false].include? is_left_child_node 
            is_left_child_node ? node.left = child_node : node.right = child_node
        end
    end

    def find(node = @root, n)
        # return if the current node is equal to n
        return node if node.data == n

        # if left or right is equal to n, then the node is found
        if node.left && node.left.data == n
            node = node.left
        elsif node.right && node.right.data == n
            node = node.right

        # if n is lesser than current node then move left, else move right
        elsif n < node.data
            find(node.left, n)
        else
            find(node.right, n)
        end
    end

    def level_order(node = @root, arr = [], queue = [@root])
        return arr if queue.length < 1

        arr << queue[0].data

        if node && node.left
            queue << node.left
        end

        if node && node.right
            queue << node.right
        end

        queue.shift
        node = queue[0]
        level_order(node, arr, queue)
    end

    def preorder(node = @root, arr = []) #nlr
        return arr if node == nil
        
        arr << node.data

        return arr if node.left == nil && node.right == nil

        preorder(node.left, arr)
        preorder(node.right, arr)
    end

    def inorder(node = @root, arr = []) #lnr
        return arr if node == nil

        inorder(node.left, arr)
        arr << node.data
        inorder(node.right, arr)
    end

    def postorder(node = @root, arr = []) #lrn
        return arr if node == nil

        postorder(node.left, arr)
        postorder(node.right, arr)
        arr << node.data
    end

    def height(node = @root, count = 0)
        return count if node.left == nil && node.right == nil

        count += 1

        leaf1 = (height(node.left, count) if node.left).to_i
        leaf2 = (height(node.right, count) if node.right).to_i

        leaf1 > leaf2 ? leaf1 : leaf2
    end

    def depth(node, current_node = @root, count=0)
        # return if the current node is equal to n
        return count if current_node.data == node.data

        count += 1
            
        # if n is lesser than current node then move left, else move right
        if node.data < current_node.data
            depth(node, current_node.left, count)
        else
            depth(node, current_node.right, count)
        end
    end

    def balanced?
        diff = (height(@root.left) - height(@root.right)).abs

        diff <= 1 ? true : false
    end

    def rebalance
        lo_array = level_order(@root)
        @root = build_tree(lo_array)
    end
end

# Driver script

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)

tree = Tree.new(Array.new(15) {rand(1..100)})

# 2. Confirm that the tree is balanced by calling `#balanced?`

pp tree.balanced?

# 3. Print out all elements in level, pre, post, and in order

puts "lo: #{tree.level_order}"
puts "pre: #{tree.preorder}"
puts "post: #{tree.postorder}"
puts "in: #{tree.inorder}"

# 4. try to unbalance the tree by adding several numbers > 100

5.times do
    tree.insert(rand(100..200))
end

# 5. Confirm that the tree is unbalanced by calling `#balanced?`

pp tree.pretty_print
pp tree.balanced?

# 6. Balance the tree by calling `#rebalance`

tree.rebalance
pp tree.pretty_print

# 7. Confirm that the tree is balanced by calling `#balanced?`

pp tree.balanced?

# 8. Print out all elements in level, pre, post, and in order

puts "lo: #{tree.level_order}"
puts "pre: #{tree.preorder}"
puts "post: #{tree.postorder}"
puts "in: #{tree.inorder}"