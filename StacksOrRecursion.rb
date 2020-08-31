def tree_height(tree_as_list)
    # your code here
    return 0 if tree_as_list.empty?
  
    l = tree_as_list.length
    p = 0
    s = 0
  
    loop do
      s += 2 ** p
      break if s >= l
  
      p += 1
    end
  
    p + 1
  end
  