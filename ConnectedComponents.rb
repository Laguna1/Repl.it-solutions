# frozen_string_literal: true

# teachers solution
def depth_first_search(graph)
  # write your code here
  result = []
  stack = [0]
  visited = []

  until stack.empty?
    head = stack.pop
    result << head
    visited << head

    not_visited = graph[head].reject { |node| visited.include? node }

    visited += not_visited
    stack += not_visited.reverse
  end

  result
end

def connected_graph?(graph)
  # write your code here
  graph.keys.size == depth_first_search(graph).size
end

puts connected_graph?({
                        0 => [2],
                        1 => [4],
                        2 => [0, 5, 3],
                        3 => [5, 2],
                        4 => [5, 1],
                        5 => [4, 2, 3]
                      })
# => true

puts connected_graph?({
                        0 => [1, 2],
                        1 => [0, 2],
                        2 => [0, 1, 3, 4, 5],
                        3 => [2, 4],
                        4 => [3, 2],
                        5 => [2]
                      })
# => true
# method 2
# def traverse(graph)
#   queue = [0]
#   visited = []
#   while queue.length > 0 do
#     queue += graph[queue[0]] - visited
#     p queue
#     queue.uniq!
#     visited << queue.shift
#   end
#   return visited
# end
# def connected_graph?(graph)
#   # write your code here
#   array_1 = traverse(graph)
#   array_2 = graph.keys
#   array_1.length == array_2.length && array_1 - array_2 == []
# end

# puts connected_graph?({
#   0 => [2],
#   1 => [4],
#   2 => [0, 5, 3],
#   3 => [5, 2],
#   4 => [5, 1],
#   5 => [4, 2, 3]
# })
# # => true

# puts connected_graph?({
#   0 => [1, 2],
#   1 => [0, 2],
#   2 => [0, 1, 3, 4, 5],
#   3 => [2, 4],
#   4 => [3, 2],
#   5 => [2]
# })
# # => true
