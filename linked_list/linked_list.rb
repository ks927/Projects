
class LinkedList
    
    class Node
        attr_accessor :value, :next_node
    
        def initialize(value=nil, next_node=nil)
        @value = value
        @next_node = next_node
        end
    end
    
    attr_accessor :head
    
    def initialize(value)
        @head = Node.new(value)
        @tail = nil
        @list_size = 0
    end
    
    def append(value)
        node = Node.new(value)
        @list_size = @list_size += 1
        if @head.nil? # if head is empty
            @head = node # make it your node
            @head = @tail # there is only one node
        else
            @tail = node
            @tail.next_node = node # make tail point to node
            @tail = @tail.next_node
       end
    end
    
    def prepend(value)
        node = Node.new(value) # create new node
        @list_size = @list_size += 1 # add size
        node.next_node = @head # point node to old head
        @head = node # new head = node
    end
    
    
end

