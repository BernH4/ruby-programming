class Node
    # include Comparable
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
        return node if node.data == n

        if node.left && node.left.data == n
            node = node.left
        elsif node.right && node.right.data == n
            node = node.right
        elsif n < node.data
            find(node.left, n)
        else
            find(node.right, n)
        end
    end

    def level_order(node = @root, arr = [@root.data], queue = [])
        return arr if node == nil

        if node.left
            queue << node.left
        end

        if node.right
            queue << node.right
        end

        level_order(node.left, arr)
        level_order(node.right, arr)
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

    def depth(node = @root, arr = [@root.data])
        return arr if node == nil

        inner_arr = []

        if node.left
            inner_arr << node.left.data
        end

        if node.right
            inner_arr << node.right.data
        end

        arr << inner_arr if inner_arr.length > 0

        depth(node.left, arr)
        depth(node.right, arr)
    end
end

tree = Tree.new([3, 4, 5, 6, 9, 10, 100, 80, 6, 8, 99])

pp tree.pretty_print

pp tree.depth

pp tree.level_order