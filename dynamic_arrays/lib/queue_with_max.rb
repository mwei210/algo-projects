# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store, :max

  def initialize
    @store = RingBuffer.new
    @max = RingBuffer.new
  end

  def enqueue(val)
    @store.push(val)
    new_max(val)
  end

  def dequeue
    val = @store.shift
    @max.shift if val == @max[0]
    val
  end

  def max
    @max[0] if @max.length > 0
  end

  def length
    @store.length
  end

  def new_max(el)
    while @max[0] && @max[@max.length - 1] < el
      @max.pop
    end
    @max.push(el) 
  end

end
