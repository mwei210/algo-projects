class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
  end

  def count
  end

  def extract
  end

  def peek
  end

  def push(val)
  end

  public
  def self.child_indices(len, parent_index)
    child1 = 2 * parent_index + 1
    child2 = 2 * parent_index + 2
    if child2 >= len
      return [child1]
    end
    [child1, child2]
  end

  def self.parent_index(child_index)
    if (child_index == 0)
      raise "root has no parent"
    end
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    child1 = child_indices(len, parent_idx)[0]
    child2 = child_indices(len, parent_idx)[1]
    comp1 = prc.call(array[parent_idx], array[child1])
    comp2 = prc.call(array[parent_idx], array[child2])
    if (comp1 == 1)
      swapped_val = array[parent_idx]
      array[parent_idx] = array[child1]
      array[child1] = swapped_val
    end
      
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
