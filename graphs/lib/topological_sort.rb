require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
    queue = []
    result = []
    count = {}
    vertices.each do |vertex|
        count[vertex] = vertex.in_edges.count
        queue << vertex if vertex.in_edges.empty?
    end
    until queue.empty?
        vertex = queue.shift
        result << vertex
        vertex.out_edges.each do |edge|
            to = edge.to_vertex
            count[to] -= 1
            queue << to if count[to] == 0
        end
    end
    if count.values.reduce(:+).zero?
        result
    else
        []
    end
end
