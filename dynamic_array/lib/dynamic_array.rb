require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
    @length += 1
  end

  # O(1)
  def pop
    raise "index out of bounds" unless @store[0]
    @store[length - 1] = nil
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    @store[length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" unless @store[0]
    shifted = @store[0]
    (1...@length).each do |i|
      @store[i - 1] = @store[i]
    end
    @length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    (@length).downto(0).each do |i|
      @store[i + 1] = @store[i]
    end
    @store[0] = val
    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity * 2)
    @capacity.times do |i|
      new_store[i] = @store[i]
    end
    @capacity *= 2
    @store = new_store
  end
end
