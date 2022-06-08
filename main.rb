# implementation of a linked list in ruby
class LinkedList
  attr_reader :head

  # adds a new node containing value to the end of the list
  def append(value)
    tail.next_node = Node.new(value)
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    if size.zero?
      @head = Node.new(value)
    else
      previous_head = @head
      @head = Node.new(value, previous_head)
    end
  end

  # returns the total number of nodes in the list
  def size
    count = 0
    current_node = @head
    unless current_node.nil?
      count += 1
      until current_node.next_node.nil?
        count += 1
        current_node = current_node.next_node
      end
    end
    count
  end

  # returns the last node in the list
  def tail
    current_node = @head
    unless current_node.nil?
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
    end
    current_node
  end

  # returns the node at the given index
  def at(index)
    @count = 0
    current_node = @head
    while @count < index
      unless current_node.next_node.nil?
        @count += 1
        current_node = current_node.next_node
      end
    end
    current_node
  end

  # removes the last element from the list
  def pop
    at(size - 2).next_node = nil
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = @head
    current_node = current_node.next_node until current_node.nil? || current_node.value == value
    if !current_node.nil?
      true
    else
      false
    end
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    count = 0
    current_node = @head
    until current_node.nil? || current_node.value == value
      unless current_node.nil?
        count += 1
        current_node = current_node.next_node
      end
    end
    count unless current_node.nil?
  end

  # represents linked list objects as strings, so you can print them out and preview them in the console
  def to_s
    string = ''
    (0..size - 1).each do |i|
      string += "(#{self.at(i).value}) -> "
    end
    string += 'nil'
    string
  end
end

# node class containing a value and link to next node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end