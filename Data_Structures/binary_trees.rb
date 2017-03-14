class BinarySearch

  class Node
    attr_accessor :value, :parent_node, :lchild_node, :rchild_node
    
    def initialize(value, lchild_node=nil, rchild_node=nil)
        @value = value
        @lchild_node = lchild_node
        @rchild_node = rchild_node
    end
  end
    
    def initialize
       @root = nil 
    end
    
    def insert_node(root, leaf)
      if leaf.value < root.value && root.lchild_node == nil
        root.lchild_node = leaf
      elsif leaf.value > root.value && root.rchild_node == nil
        root.rchild_node = leaf
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
    
    def breadth_first_search(value)
        return nil if @root.nil?
        queue = [@root]
        until queue.empty?
            current = queue.shift # shifts out first item
            return current if current.value == value
            queue << current.lchild_node unless current.lchild_node == nil
            queue << current.rchild_node unless current.rchild_node == nil
        end
        return nil
    end
    
    def depth_first_search(value)
        return nil if @root.nil?
        stack = [@root]
        until stack.empty?
            current = stack.pop # pops off last item
            return current if current.value == value
            stack << current.lchild_node unless current.lchild_node == nil
            stack << current.rchild_node unless current.rchild_node == nil
        end
        return nil
    end
    
    def dfs_rec(value, current=@root)
        return nil if @root.nil?
        return current if current.value == value
        if value <= current.value
            dfs_rec(value, current.lchild_node) unless current.lchild_node == nil
        else
            dfs_rec(value, current.rchild_node) unless current.rchild_node == nil
        end
    end

end

tree = BinarySearch.new
tree.build_tree[1, 5, 4, 7, 2, 365]
tree.dfs_rec(7)

