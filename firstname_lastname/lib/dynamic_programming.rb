class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 
      1 => [[1]], 
      2 => [[1, 1], [2]], 
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    @super_frog_cache = {
      1 => [[1]]
    }
  end

  def blair_cache_builder(n)
    cache = { 1 => 1, 2 => 2 }
    return cache if n < 3
    (3..n).each do |i|
      cache[i] = cache[i - 1] + cache[i - 2] + (2 * (i - 1) - 1)
    end
    cache
  end

  def blair_nums(n)
    # top-down
    # return @blair_cache[n] unless @blair_cache[n].nil?
    # ans = blair_nums(n - 2) + blair_nums(n - 1) + (2 * (n - 1) - 1)
    # @blair_cache[n] = ans
    # return ans

    # bottom-up
    cache = blair_cache_builder(n)
    cache[n]
  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 
      1 => [[1]], 
      2 => [[1, 1], [2]], 
      3 => [[1, 1, 1], [1, 2], [2, 1], [3]]
    }
    return cache if n < 4
    (4..n).each do |i|
      cache[i] = []
      1.upto(3) do |j|
        cache[i] += cache[i - j].map { |el| [j] + el }
      end
    end
    cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)
  end
  
  def frog_hops_top_down_helper(n)
    return @frog_cache[n] unless @frog_cache[n].nil?
    ans = frog_hops_top_down_helper(n - 1).map { |el| [1] + el } +
          frog_hops_top_down_helper(n - 2).map { |el| [2] + el } +
          frog_hops_top_down_helper(n - 3).map { |el| [3] + el }
    @frog_cache[n] = ans
    return ans
  end

  def super_frog_hops(n, k)
    cache = super_frog_cache_builder(n, k)
    cache[n]
  end

  def super_frog_cache_builder(n, k)
    cache = { 
      0 => [[]],
      1 => [[1]]
    }
    return cache if n < 2
    (2..n).each do |i|
      cache[i] = []
      1.upto(k) do |j|
        cache[i] += cache[i - j].map { |el| [j] + el } if i >= j
      end
    end
    cache
  end

  def knapsack(weights, values, capacity)
    cache = knapsack_table(weights, values, capacity)
    cache[-1][-1]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    cache = {
      0 => [[0, 0, 0]]
    }
    return cache if n < 1
    (1..n)
  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
