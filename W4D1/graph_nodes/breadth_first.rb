require_relative './graphnode.rb'
require 'Set'



def bfs(starting_node, target_value)
    queue = []
    visited = Set.new
    queue << starting_node
    until queue.empty?
        node = queue.shift
        visited << node
        return node if node.value == target_value
        unless node.neighbors.empty?
            node.neighbors.each do |sub_node|
                queue << sub_node unless visited.include?(sub_node)
            end
        end
    end
    return nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

bfs(a, 'f')