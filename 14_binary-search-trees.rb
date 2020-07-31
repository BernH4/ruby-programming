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

        root = Node.new(arr[mid])

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
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]).pretty_print

pp tree