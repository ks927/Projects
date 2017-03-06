
class LinkedList
    
    class Node
        attr_accessor :value, :next_node
    
        def initialize(value, next_node=nil)
        @value = value
        @next_node = next_node
        end
    end
    
    attr_accessor :head
    
    def initialize(value)
        @head = Node.new(value)
        @tail = @head
        @list_size = 1
    end
    
    def append(value)
        node = Node.new(value)
        @list_size = @list_size += 1
            @tail.next_node = node # make tail point to node
            @tail = node # make node last element
    end
    
    def prepend(value)
        node = Node.new(value) # create new node
        @list_size = @list_size += 1 # add size
        node.next_node = @head # point node to old head
        @head = node # new head = node
    end
    
    def size
        return @list_size
    end
    
    def head
       return @head 
    end
    
    def tail
       return @tail 
    end
    
    def at(index)
        if index < 0 || index >= @list_size
            puts "Error: Incorrect index"
        else
        node = @head
        count = 0
        while count != index
            node = node.next_node
            count += 1
        end
        return node.value
        end
    end
    
    def pop
        current_node = @head
        current_node = current_node.next_node until current_node.next_node == @tail
            @tail.value = nil
            @tail = current_node
            @tail.next_node = nil
    end
        
    def contains?(value)
        node = @head
        count = 0
        while count != @list_size
            if node.value == value
                return true
            end
            node = node.next_node
            count += 1
        end
    end
        
    def find(data)
        node = @head
        count = 0
        while count != @list_size
            if node.value == data
                return count
            end
            node = node.next_node
            count += 1
        end
    end
    
    def to_s
        node = @head
        str = ""
        count = 0 
        while count != @list_size
            str << "( #{node.value} ) -> "
            node = node.next_node
            count += 1
          end
          str << "nil"
          str
    end
        
        
end
    
    
    
    
    
    
    
    
    
    
    
    

