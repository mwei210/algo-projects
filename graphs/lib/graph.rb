class Vertex
  attr_accessor :in_edges, :out_edges, :value
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    @to_vertex.in_edges << self
    @from_vertex.out_edges << self
  end

  def destroy!
    @to_vertex.in_edges.pop
    @from_vertex.out_edges.pop
    @to_vertex = nil
    @from_vertex = nil
  end
end
