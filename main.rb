# Find a shortest path from start to finish using BFT method
def knight_traversal(start, finish)
  # Returns if there is no path to take
  return print_path([start]) if start == finish

  # Returns if inputs are invalid
  return unless valid_position?(start)
  return unless valid_position?(finish)

  
  board = build_graph

  q = [[start]]
  visited = [start]

  until q.empty?
    current_path = q.shift
    current_position = current_path.last
    
    board[current_position].each do |turn|
      next if visited.include?(turn)

      new_path = current_path + [turn]
      q << new_path
      visited << turn

      # Print current path if the destination is found
      return print_path(new_path) if turn == finish
    end
  end
end

def print_path(path)
  puts "=> You made it in #{path.length - 1} moves!"
  path.each { |position| p position }
end

# Build a graph out of the entire board where each cell is a vertex and each move that a knight could make is an edge
def build_graph
  graph = {}
  (0..7).each do |i|
    (0..7).each do |j|
      position = [i, j]
      moves = generate_moves(position).select { |move| valid_position?(move) }
      graph[position] = moves
    end
  end
  graph
end

def generate_moves(position)
  moves = [
    [-1, -2], [-2, -1], [-2, 1], [-1, 2],
    [1, -2], [2, -1], [2, 1], [1, 2]
  ]

  moves.map { |move| [position[0] + move[0], position[1] + move[1]] }
end

def valid_position?(position)
  position.all? { |coord| coord >= 0 && coord < 8 }
end


knight_traversal(['dad', 0], [3, 3])
# => You made it in 3 moves! 
# [0, 0]
# [2, 1]
# [3, 3]