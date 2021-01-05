require_relative 'bst'

bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p bst.pretty_print
p bst.height(bst.find(8))
p bst.depth(bst.find(324))
