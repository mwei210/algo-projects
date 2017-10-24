require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
    bst = BinarySearchTree.new
    sorted_arr = bst.in_order_traversal(tree_node)
    value = sorted_arr[k * -1]
    bst.find(value, tree_node)
end
