class Board
    
  class Node 
    attr_accessor :parent, :children
    attr_reader :pos
    def initialize(pos, parent=nil)
      @pos = pos
      @parent = parent
      @children = []
    end 
    
  end 
  attr_reader :loc
  def initialize(loc)
        @loc = Node.new(loc)
        @visited = []
    end
  
    
    # check if pos is within 8x8 board
    def check_move(pos)
        return (pos[0] > -1 && pos[0] < 8) && (pos[1] > -1 && pos[1] < 8) ? true : false
    end
    
    # use check_move on possible knight maneuvers
    def next_moves(new_pos)
      possible_moves = [[2,1], [-2,1], [2,-1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]]
      moves = []
      possible_moves.each { |move| moves << [new_pos[0]+move[0], new_pos[1]+move[1]] }
      moves.select { |square| check_move(square) }
    end
    
    # create path to the target square
    def create_path(target)
        current = @loc
        queue = [@loc]
    
        until current.pos == target
            current = queue.shift
            @visited << current.pos
            positions = next_moves(current.pos)
        
            positions.each do |square|
                unless @visited.include?(square)
                    node = Node.new(square)
                    current.children << node
                    node.parent = current
                    queue << node
                end
            end
        end
    current 
    end
    
    # use breadth-first-search to queue
    def knight_moves(start, finish)
        board = Board.new(start)
        target = board.create_path(finish)
        current = target
        path = []
        until current.nil?
            path << current.pos
            current = current.parent
        end
        puts "You made it in #{path.size-1} moves! Here's your path: "
        puts "#{path.reverse}"
    end
end


knight = Board.new
knight.knight_moves([0,0], [3,3])


