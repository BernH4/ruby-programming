class Node
    attr_accessor :next, :data

    def initialize(data)
        @next = nil
        @data = data
    end
end

class LinkedList
    attr_accessor :head, :tail

    def initialize
        @head = nil
        @tail = nil
    end

    def full_list
        all = []

        all << @head.data

        current_node = @head

        until current_node.next.nil?       
            current_node = current_node.next
            all << current_node.data
        end

        return all
    end

    def append(value)
        node = Node.new value
        
        if @head.nil?
            @head = node
        elsif @tail.nil? == false
            @tail.next = node
            @tail = node
        else
            @tail = node
        end
    end

    def prepend(value)
        node = Node.new value
        node.next = @head

        if @tail.nil?
            @tail = node.next
        end
            
        @head = node
    end

    def size
        full_list.length
    end

    def at(index)
        count = 0
        current_node = @head

        while count < index && current_node.next != nil
            current_node = current_node.next
            count += 1
        end

        current_node if count == index
    end

    def pop
        @tail = at(size-2)
        @tail.next = nil
    end

    def contains?(value)
        for i in 0..size-1
            return true if value == at(i).data
        end

        false
    end

    def find(value)
        for i in 0..size-1
            return i if value == at(i).data
        end

        nil
    end

    def to_s
        str = ''

        full_list.each do |el|
            str += "(#{el}) -> "
        end

        str + "nil"
    end

    def insert_at(index, value)
        if at(index) != nil
            at(index).data = value
        else
            puts "No index found, please consider using append or prepend"
        end
    end

    def remove_at(index)
        if at(index) != nil
            at(index-1).next = at(index+1)
        else
            puts "No index found"
        end
    end
end

