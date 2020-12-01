# class Node
# 	attr_reader :data
# 	attr_accessor :left, :right
	
# 	def initialize data
# 		@data = data
# 	end
# end

# def array_to_tree(array, i = 0)
#   return nil if i >= array.length || array[i] == 0

#   node = Node.new(array[i])
#   node.left = array_to_tree(array, 2*i+1)
#   node.right = array_to_tree(array, 2*i+2)

#   node
# end

# def search_tree? (tree)
#   root = array_to_tree(tree)
#   search_helper(root)
# end

# def search_helper (node, min = nil, max = nil)
#   return true if node.nil?
#   return false if min && node.data < min
#   return false if max && node.data > max
#   search_helper(node.left, min, node.data) && search_helper(node.right, node.data, max)
# end

 
# puts search_tree?([10, 4, 12])
# # => true

# puts search_tree?([10, 5, 7])
# # => false

# puts search_tree?([7, 5, 9, 3, 0, 8, 10])

# model solution =>
class Node
    attr_reader :data
    attr_accessor :left, :right
  
    def initialize(data)
      @data = data
    end
  end
  
  def array_to_tree(array, i)
    return nil if i >= array.length || array[i] == 0
  
    node = Node.new(array[i])
    node.left = array_to_tree(array, 2*i+1)
    node.right = array_to_tree(array, 2*i+2)
  
    node
  end
  
  def search_tree?(array_tree)
    # write your code here
    tree = array_to_tree(array_tree, 0)
    
    in_order_array = in_order(tree)
    
    in_order_array == in_order_array.sort
  end
  
  def in_order(node)
    if node == nil
      return []
    end
  
    result = in_order(node.left)
    result << node.data
    result += in_order(node.right)
  end
  
  puts search_tree?([10, 4, 12])
  # => true
  
  puts search_tree?([10, 5, 7])
  # => false