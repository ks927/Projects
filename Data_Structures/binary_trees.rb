class BinarySearch

class Node
    attr_accessor :value, :parent_node, :lchild_node, :rchild_node
    
    def initialize(value, parent_node=nil, lchild_node=nil, rchild_node=nil)
        @value = value
        @lchild_node = lchild_node
        @rchild_node = rchild_node
    end
    
    def initialize
       @root = nil 
    end
    
    def insert_node(root, leaf)
    return leaf if root.nil?
    if leaf.value < root.value && root.lchild_node == nil
        root.lchild_node = leaf
    elsif leaf.value > root.value && root.rchild_node == nil
        root.rchilde_node = leaf
    elsif leaf.value < root.value && root.lchild_node != nil
        insert_node(root.lchild_node, leaf)
    elsif leaf.value > root.value && root.rchild_node != nil
        insert_node(root.rchild_node, leaf) 
    elsif leaf.value == root.value && root.rchild_node != nil
        insert_node(root.rchild_node, leaf) 
    end
end
    
    def build_tree(arr)
        @root = Node.new(arr[0])
        
        arr.each do |value|
           leaf = Node.new(value)
           insert_node(@root, leaf)
        end
    end
    
end
    
end

# [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# [1, 2, 3, 4, 5, 6, 7]

begin

end