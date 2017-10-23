class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @first = Node.new
    @last = Node.new
    @first.next = @last
    @last.prev = @first
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @first.next
  end

  def last
    @last.prev
  end

  def empty?
    first.next.nil? && last.prev.nil?
  end

  def get(key)
    get_node = select { |node| node.key == key }.first
    get_node.nil? ? nil : get_node.val
  end

  def include?(key)
    any? { |node| node.key == key }
  end

  def append(key, val)
    new_node = Node.new(key, val)
    previous = @last.prev
    @last.prev = new_node
    previous.next = new_node
    new_node.prev = previous
    new_node.next = @last
  end

  def update(key, val)
    each { |node| node.val = val if node.key == key}
  end

  def remove(key)
    node_to_remove = select { |node| node.key == key }.first
    previous = node_to_remove.prev
    child_node = node_to_remove.next
    previous.next = child_node
    child_node.prev = previous
  end

  def each
    node_to_check = first
    until node_to_check.next.nil?
      yield(node_to_check)
      node_to_check = node_to_check.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
