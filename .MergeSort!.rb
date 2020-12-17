# def merge_sort(array1, array2)
#     # write your code here
#     sorted_arr = []
#     until array1.empty? || array2.empty?
#       sorted_arr <<  (array1[0] < array2[0] ? array1.shift : array2.shift)
#     end
#     sorted_arr + array1 + array2
#   end
  
#   p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
#   # => [1, 2, 3, 4, 6, 8, 9, 11]

# Model sOLUTION

def merge_sort(array1, array2)
    # write your code here
    sorted_array = []
    i = 0
    j = 0
    
    while i < array1.size && j < array2.size
      if array1[i] < array2[j]
        sorted_array << array1[i]
        i += 1
      else
        sorted_array << array2[j]
        j += 1
      end
    end
    
    if i < array1.size
      sorted_array.concat(array1[i..-1])
    end
    
    if j < array2.size
      sorted_array.concat(array2[j..-1])
    end
  
    sorted_array
  end
  
  p merge_sort([1, 3, 9, 11], [2, 4, 6, 8])
  # => [1, 2, 3, 4, 6, 8, 9, 11]