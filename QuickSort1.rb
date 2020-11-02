# (model solution)
# def partition(array)
#     # write your code here
#     pivot = array.first
#     smaller = []
#     greater = []
    
#     array[1..-1].each do |number|
#       if number > pivot
#         greater << number
#       else
#         smaller << number
#       end
#     end
    
#     smaller + [pivot] + greater
#   end
  
#   p partition([4, 5, 3, 9, 1])
#   # => [3, 1, 4, 5, 9]

def partition(array)
    # write your code here
    first = array[0]
    right = []
    left = []
  
    for i in 1..(array.length - 1)
      if first > array[i] 
        left << array[i] 
      else 
        right <<  array[i]
      end
    end
    left + [first] + right
    
  end
  
  p partition([4, 5, 3, 9, 1])
  # => [3, 1, 4, 5, 9]