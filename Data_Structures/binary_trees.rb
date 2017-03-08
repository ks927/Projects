
class Node
    attr_accessor :value, :parent_node, :lchild_node, :rchild_node
    
    def initialize(value, parent_node=nil, lchild_node=nil, rchild_node=nil)
        @value = value
        @lchild_node = lchild_node
        @rchild_node = rchild_node
    end
    
    def build_tree(arr, arr_start=0, arr_end=arr.length-1)
        return arr if arr_start > arr_end
        
        root = arr_start + (arr_end - arr_start)/2
        puts arr[root]
        node = Node.new(arr[root])
        
        @lchild_node = build_tree(arr, arr_start, root-1)
        @rchild_node = build_tree(arr, root+1, arr_end)
        
        return node
      
    end
    
end

# [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
# [1, 2, 3, 4, 5, 6, 7]

=begin
def insert_node(root, leaf)
    return leaf if root.nil?
    if leaf.value < root.value
        leaf.value = @lchild_node
    elsif leaf.value > root.value
        leaf.value = @rchild_node
end
=end