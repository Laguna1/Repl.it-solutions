# def full_counting_sort_prep(array)
#     # write your code here
#     arr_stg = array.map {|x| x[/\d+/]}
#     arr_int = arr_stg.map(&:to_i)
#     result = []

#     (0..99).each do |i|
#       count = 0
#       arr_int.each {|j| count += 1 if j <= i}
#       result << count
#     end
#     result

#   end

# MODEL sOLUTION

def full_counting_sort_prep(array)
  # write your code here
  counts_array = get_counts_array(array)

  (1...counts_array.size).each do |index|
    counts_array[index] += counts_array[index - 1]
  end

  counts_array
end

def get_counts_array(numbers)
  counts = Array.new(100, 0)

  numbers.each do |element|
    counts[element.to_i] += 1
  end

  counts
end

p full_counting_sort_prep(['4 that', '3 be', '0 to', '1 be', '5 question', '1 or', '2 not', '4 is', '2 to', '4 the'])
# => [1, 2, 2, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
