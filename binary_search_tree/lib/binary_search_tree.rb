# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require 'bst_node'

class BinarySearchTree

  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    if @root
      insert_into_subtree(value, @root)
    else
      @root = BSTNode.new(value)
    end
  end

  def find(value, tree_node = @root)
    return nil unless tree_node
    if tree_node.value == value
      return tree_node
    else
      find_by_subtree(value, tree_node)
    end
  end

  def delete(value)
    deleted = find(value)
    if deleted.left.nil? && deleted.right.nil?
      if @root.value == value
        @root = nil
      else
        if value < deleted.parent.value
          deleted.parent.left = nil
        else
          deleted.parent.right = nil
        end
      end
    elsif deleted.left && deleted.right
      r = maximum(deleted.left)
      if value < deleted.parent.value
        deleted.parent.left = r
      else
        deleted.parent.right = r
      end
      r.parent.right = r.left if r.left
    else
      if value < deleted.parent.value
        deleted.parent.left = deleted.left if deleted.left
        deleted.parent.left = deleted.right if deleted.right
      else
        deleted.parent.right = deleted.left if deleted.left
        deleted.parent.right = deleted.right if deleted.right
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    return tree_node unless tree_node.right
    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    if tree_node.nil? || (tree_node.right.nil? && tree_node.left.nil?)
      return 0
    end
    left = 0
    right = 0
    if tree_node.left && tree_node.right.nil?
      left += 1
      left += depth(tree_node.left)
    elsif tree_node.right && tree_node.left.nil?
      right += 1
      right += depth(tree_node.right)
    else
      left += 1
      right += 1
      left += depth(tree_node.left)
      right += depth(tree_node.right)
    end
    left > right ? left : right
  end 

  def is_balanced?(tree_node = @root)
    return true if depth(tree_node).zero?
    left_tree = tree_node.left if tree_node.left
    right_tree = tree_node.right if tree_node.right
    left_depth = depth(left_tree)
    right_depth = depth(right_tree)
    if (left_depth - right_depth).abs > 1 || !is_balanced?(left_tree) || !is_balanced?(right_tree)
      false
    else
      true
    end
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end
    arr.push(tree_node.value)
    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end
    arr
  end


  private
  # optional helper methods go here:
  def insert_into_subtree(value, root)
    if (value <= root.value)
      if root.left
        root = root.left
        insert_into_subtree(value, root)
      else
        root.left = BSTNode.new(value, root)
      end
    else
      if root.right
        root = root.right
        insert_into_subtree(value, root)
      else
        root.right = BSTNode.new(value, root)
      end
    end
  end

  def find_by_subtree(value, root)
    if value < root.value
      find(value, root.left)
    else
      find(value, root.right)
    end
  end
end
