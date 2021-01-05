require_relative 'bst'

bst = Tree.new(Array.new(15) { rand(1..100)})
bst.pretty_print
p "Is the tree balanced?"
p bst.balanced?
gets

p "Preorder"
p bst.preorder_array()
gets

p "Inorder"
p bst.inorder_array()
gets

p "Postorder"
p bst.postorder_array()
gets

p "Level Order"
p bst.level_order_array()
gets

p "Add some numbers"
bst.insert(230)
bst.insert(300)
bst.insert(256)
bst.insert(156)
bst.pretty_print()
gets

p "Is it balanced?"
p bst.balanced?
gets

p "Lets balance it"
bst.rebalance()
bst.pretty_print()
gets

p "Is it balanced?"
p bst.balanced?
gets

p "Preorder"
p bst.preorder_array()
gets

p "Inorder"
p bst.inorder_array()
gets

p "Postorder"
p bst.postorder_array()
gets

p "Level Order"
p bst.level_order_array()
gets
