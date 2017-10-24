# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
    result = []
    dep_vertices = []
    arr.each do |el|
        dep_vertices << el[0]
    end
    values = (1..dep_vertices.max).to_a
    vertices = values.map do |val|
        Vertex.new(val)
    end
    edges = arr.map do |el|
        Edge.new(vertices[el[0] - 1], vertices[el[1] - 1])
    end
    topological_sort(vertices).map do |vertex|
        result << vertex.value
    end
    result.reverse
end
