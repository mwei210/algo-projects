class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length <= 1
    prc ||= Proc.new { |x, y| x <=> y }
    pivot_idx = partition(array, start, length, &prc)
    sort2!(array, start, pivot_idx - start, &prc)
    sort2!(array, pivot_idx + 1, length - (pivot_idx - start + 1), &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    barrier = start
    array[start + 1...start + length].each_with_index do |el, idx|
      if (prc.call(el, array[start]) == -1)
        barrier += 1
        array[start + 1 + idx], array[barrier] = array[barrier], array[start + 1 + idx]
      end
    end
    array[barrier], array[start] = array[start], array[barrier]
    barrier
  end
end
