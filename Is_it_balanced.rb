# frozen_string_literal: true

class Node
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
  end
end

def array_to_tree(array, i)
  return nil if i >= array.length || (array[i]).zero?

  node = Node.new(array[i])
  node.left = array_to_tree(array, 2 * i + 1)
  node.right = array_to_tree(array, 2 * i + 2)

  node
end

def recursive_tree_height(tree)
  return 0 if tree.nil?
  return 1 if tree.left.nil? && tree.right.nil?

  [recursive_tree_height(tree.left), recursive_tree_height(tree.right)].max + 1
end

def balanced_tree?(array_tree)
  # write your code here
  tree = array_to_tree(array_tree, 0)

  balanced_tree_recursive?(tree)
end

def balanced_tree_recursive?(tree)
  return true if tree.nil? || (tree.left.nil? && tree.right.nil?)

  balanced_tree_recursive?(tree.left) &&
    balanced_tree_recursive?(tree.right) &&
    (recursive_tree_height(tree.left) - recursive_tree_height(tree.right)).abs <= 1
end

puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
# => false

puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
# => true

# class Node
#     attr_reader :data
#     attr_accessor :left, :right
#     def initialize(data)
#       @data = data
#     end
#    end
#    def array_to_tree(array, i=0)
#     return nil if i >= array.length || array[i] == 0
#     node = Node.new(array[i])
#     node.left = array_to_tree(array, 2*i+1)
#     node.right = array_to_tree(array, 2*i+2)
#     node
#    end
#    def height(node)
#     return 0 if node.nil?
#     return 1 if node.left == nil && node.right == nil
#    [height(node.left), height(node.right)].max + 1
#    end
#    def balanced_tree? (array)
#     root = array_to_tree(array)
#     stack = [root]
#     until stack.empty?
#       current = stack.pop
#       left_height = height(current.left)
#       right_height = height(current.right)
#       return false if (left_height - right_height).abs > 1
#       stack.push(current.right) unless current.right.nil?
#       stack.push(current.left) unless current.left.nil?
#     end
#     true
#    end

#    puts balanced_tree?([1, 2, 0, 3, 4, 0, 0])
#    # => false

#    puts balanced_tree?([1, 2, 3, 4, 5, 6, 7])
#    # => true
