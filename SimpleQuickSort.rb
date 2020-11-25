def simple_quicksort(array)
    # write your code here
    return array if array.length < 2
    first = array[0]
    right = []
    left = []
  
    for i in 1..(array.length - 1)
    if first > array[i]
      left << array[i]
      else right <<  array[i]
      end
    end
    left = simple_quicksort(left)
    right = simple_quicksort(right)
    result = left + [first] + right
    puts result.join(" ")
    result
  end
  
  p simple_quicksort([5, 8, 1, 3, 7, 10, 2])
  # => 2 3
  #    1 2 3
  #    7 8 10
  #    1 2 3 5 7 8 10