class Tree
  attr_accessor :children, :node_name
  
  def initialize(data)
    data.each do |k, v|
      @node_name = k
      @children = v.inject([]) {|a, (k, v)| a.push(Tree.new({k => v}))}
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({"Ruby" => {"Reia"=>{}, "MacRuby"=>{}}})

puts "Visitiing a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
