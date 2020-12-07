# frozen_string_literal: true

stack = ['']
until stack.empty?

  str = stack.pop

  next if str.length > 3

  patterns << str unless str.empty?

  %w[A B C].each do |rune|
    stack << str + rune
  end
end
