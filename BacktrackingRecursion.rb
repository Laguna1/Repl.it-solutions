# frozen_string_literal: true

def exact_sum?(k, coins)
  # write your code here
  return true if k.zero?
  return false if coins.empty? || k.negative?

  exact_sum?(k - coins[0], coins[1..-1]) || exact_sum?(k, coins[1..-1])
end

puts exact_sum?(12, [1, 2, 3, 4, 5])
# => true

puts exact_sum?(11, [1, 5, 9, 13])
# => false
