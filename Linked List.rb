# frozen_string_literal: true

# Start with your code from last challenge.
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  # setup head and tail

  def initialize
    @head = nil
    @ntail = nil
    @size = 0
  end

  def add(number)
    # your code here
    node = Node.new(number)
    @head ? (@tail.next_node = node) : (@head = node)
    @tail = node
  end

  def get(index)
    # your code here
    if index.negative?
      nil
    else
      node = @head
      index.times { node = node.next_node }
      node.value
    end
  end

  def get_node(index)
    i = 0
    node = @head
    while i < index
      i += 1
      node = node.next_node
    end
    node
  end

  def nodes(node = @head)
    until node.nil?
      result = yield(node)
      node = node.next_node
    end
    result
  end

  def at(index)
    index += @size if index.negative?
    counter = 0
    nodes { |node| return node if counter == index; counter += 1 }

  end

  def add_at(index, item)
    node = Node.new(item, at(index))
    add(node) if index > @size
    index.zero? ? @head = node : at(index - 1).next_node = node
  end

  def remove(index)
    if index.negative?
      nil
    else
      node = @head
      if index.zero?
        @head = node.next_node
      else
        (index - 1).times { node = node.next_node }
        node.next_node = node.next_node.next_node
      end
    end
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
list.add_at(1, 11)
list.add_at(0, 13)

puts list.get(2)
# => 11

puts list.get(3)
# => 5

# teacher`s solution
# Start with your code from last challenge.
class Node
  # your node code here
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def add(number)
    new_node = Node.new(number)

    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def add_at(index, number)
    new_node = Node.new(number)

    if @head.nil?
      @head = new_node
      @tail = new_node
    elsif index.zero?
      new_node.next_node = @head
      @head = new_node
    else
      previous_node = get_node(index - 1)
      next_node = previous_node&.next_node
      previous_node.next_node = new_node
      new_node.next_node = next_node
    end
  end

  def get(index)
    node = get_node(index)

    node&.value
  end

  def remove(index)
    if index.zero?
      value = @head.value
      @head = @head&.next_node
      return value
    end

    previous_node = get_node(index - 1)
    value = previous_node.next_node.value
    previous_node.next_node = previous_node&.next_node&.next_node

    @tail = previous_node if previous_node == @tail

    value
  end

  private

  def get_node(index)
    node = @head

    while index.positive? && node
      node = node.next_node
      index -= 1
    end

    node
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
list.add_at(1, 11)
list.add_at(0, 13)

puts list.get(2)
# => 11

puts list.get(3)
# => 5
