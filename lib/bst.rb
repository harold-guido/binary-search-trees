class Tree
  attr_accessor :root

  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    if array.length == 1
      Node.new(array[0], nil, nil)

    elsif array.length == 2
      Node.new(array[1], Node.new(array[0], nil, nil), nil)
      
    else
      left_tree = array.slice!(0...array.length/2)
      temp_root = array.slice!(0)
      right_tree = array
      
      Node.new(temp_root, build_tree(left_tree), build_tree(right_tree))
    end
  end

  def inorder_array(node = @root)
    if node.left == nil && node.right == nil then
      [node.value]

    elsif node.left == nil
      [node.value] + inorder_array(node.right) 

    elsif node.right == nil
      inorder_array(node.left) + [node.value]

    else
      inorder_array(node.left) + [node.value] + inorder_array(node.right)

    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
      pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right

      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"

      pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, node = @root)
    @root = build_tree(self.inorder_array().push(value).sort.uniq)
  end

  #ALTERNATIVE INSERT
    #if value >= node.value then
      #node.right == nil ? node.right = Node.new(value, nil, nil) : insert(value, node.right)
    #else
      #node.left == nil ? node.left = Node.new(value, nil, nil) : insert(value, node.left)
    #end

  def delete(value, node = @root)
    self.inorder_array().include?(value) ? @root = build_tree(self.inorder_array().delete(value))
    : (puts "No such value in tree")
  end

  def rebalance(node = @root)
    @root = build_tree(self.inorder_array().uniq)
  end
end

class Node
  attr_accessor :value, :left, :right

  def initialize(value, left = nil, right = nil)
    @value = value
    @right = right
    @left = left
  end
end
