class BSTNode
  attr_accessor :value, :left, :right, :parent
  
  def initialize(value, parent = nil)
    @value = value
    @left = nil
    @right = nil
    @parent = parent
  end
end
