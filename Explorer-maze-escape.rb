# frozen_string_literal: true

def maze_escape(maze)
  # write your code here
  maze[0][0] = 2
  goal_coord = find_goal(maze)
  path = maze_runner(maze, 0, 0, goal_coord)

  path
end

def find_goal(maze)
  length = maze.size
  i = 0
  while i < length
    j = 0
    while j < length
      return [i, j] if maze[i][j] == 9

      j += 1
    end
    i += 1
  end
end

def sort_distance(coordinates, target)
  distances = []
  coordinates.each do |coord|
    distances.push((target[0] - coord[0]) * (target[0] - coord[0]) + (target[1] - coord[1]) * (target[1] - coord[1]))
  end
  # bubble sorte
  bubble_sort(distances, coordinates)

  coordinates
end

def bubble_sort(distances, coordinates)
  total = distances.size - 1
  change = true
  while total.positive? && change
    change = false
    i = 0
    while i < total
      if distances[i] > distances[i + 1]
        distances[i], distances[i + 1] = distances[i + 1], distances[i]
        coordinates[i], coordinates[i + 1] = coordinates[i + 1], coordinates[i]
        change = true
      end
      i += 1
    end
    total -= 1
  end
end

def maze_runner(maze, i, j, goal_coord)
  if maze[i][j] == 9
    [[j, i]]
  else

    next_coord = []
    length = maze.size

    [-1, 1].each do |horizontal|
      if j + horizontal >= 0 && j + horizontal < length
        if (maze[i][j + horizontal]).zero?
          maze[i][j + horizontal] = 2
          next_coord.push([i, j + horizontal])
        elsif maze[i][j + horizontal] == 9
          return [[j, i], [j + horizontal, i]]
        end
      end
    end

    [-1, 1].each do |vertical|
      if i + vertical >= 0 && i + vertical < length
        if (maze[i + vertical][j]).zero?
          maze[i + vertical][j] = 2
          next_coord.push([i + vertical, j])
        elsif maze[i + vertical][j] == 9
          return [[j, i], [j, i + vertical]]
        end
      end
    end
    sort_distance(next_coord, goal_coord) unless next_coord.empty?
    next_coord.each do |coord|
      result = maze_runner(maze, coord[0], coord[1], goal_coord)

      unless result.nil?
        actual = [[j, i]].concat(result)
        return actual
      end
    end
    nil
  end
end
p maze_escape(
  [
    [0, 0, 0, 0, 0],
    [0, 1, 0, 1, 0],
    [0, 1, 0, 1, 1],
    [0, 1, 0, 0, 0],
    [0, 0, 0, 1, 9]
  ]
)
# => [
#      [0, 0],
#      [1, 0],
#      [2, 0],
#      [2, 1],
#      [2, 2],
#      [2, 3],
#      [3, 3],
#      [4, 3],
#      [4, 4]
#    ]
#
p maze_escape(
  [
    [0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 1, 0, 0],
    [0, 1, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 0, 9],
    [0, 1, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 1, 0, 0]
  ]
)
p maze_escape(
  [
    [0, 0, 0, 0, 0, 1, 0, 0, 0],
    [0, 1, 0, 1, 0, 1, 1, 0, 1],
    [0, 1, 0, 1, 0, 0, 0, 0, 0],
    [1, 1, 0, 1, 1, 1, 0, 1, 1],
    [0, 0, 0, 0, 0, 1, 0, 0, 1],
    [1, 1, 1, 1, 0, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 1],
    [0, 1, 1, 0, 0, 1, 1, 0, 9],
    [0, 0, 1, 0, 0, 0, 0, 0, 0]
  ]
)
