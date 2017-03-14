class Board
    
  class Node 
    attr_accessor :pos, :parent, :children
    
    def initialize(pos, parent=nil, children=[])
      @pos = pos.include?@board ? @pos : nil 
      @parent = parent
      @children = []
    end 
    
  end 
  
  def initialize(loc)
        @loc = Node.new(loc) 
        @board = []
        build_board
    end
  
	def build_board
		(0..7).each do |i|
			(0..7).each do |j|
				@board << [i, j]
			end
		end
	end
    
    def check_move(pos)
        (pos[0] > -1 && pos[0] < 8) && (pos[1] > -1 pos[1] < 8) ? true : false
    end
    
    def next_moves(new_pos)
      possible_moves = [[2,1], [-2, 1], [2, -1], [-2,-1], [1, 2], [-1, 2], [1, -2], [-1, -2]]
      node = new_pos.value
      possible_moves.each do |move|
       new_node = [node[0]+move[0], node[1]+move[1]]
       if new_node.include?@board
         node_children = Node.new(new_node, node)
         node.children.push(node_children)
       end
     end
    end
    
    def bfs(pos, move)
      return nil if !move.include?(@board)
      queue = [@pos]
      until queue.empty?
        current = queue.shift
        return current if current.value == move
        next_moves(move)
      end
    end 
    
    
end