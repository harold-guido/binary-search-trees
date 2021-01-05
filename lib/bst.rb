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

  def level_order(node_queue = [@root], return_array = [])
    temp_node_queue = []

    node_queue.each do |node| 
      return_array.push(node.value)

      unless node.right == nil && node.left == nil
        if node.left == nil
          temp_node_queue + [node.right] 

        elsif node.right == nil 
          temp_node_queue + [node.left]

        else
          temp_node_queue + [node.left] + [node.right]
        end
      end
    end
      
    temp_node_queue.length != 0 ? level_order(temp_node_queue, return_array) : return_array
  end

  def preorder_array(node = @root)
    if node.left == nil && node.right == nil then
      [node.value]

    elsif node.left == nil
      [node.value] + inorder_array(node.right)

    elsif node.right == nil
      [node.value] + inorder_array(node.left)

    else
      [node.value] + inorder_array(node.left) + inorder_array(node.right)

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

  def postorder_array(node = @root)
    if node.left == nil && node.right == nil then
      [node.value]

    elsif node.left == nil
      inorder_array(node.right) + [node.value]

    elsif node.right == nil
      inorder_array(node.left) + [node.value]

    else
      inorder_array(node.left) + inorder_array(node.right) + [node.value]

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

  def find(value, node = @root)
    if node != nil
      value == node.value ? node : value < node.value ? find(value, node.left) : find(value, node.right)
    else
      nil
    end
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
