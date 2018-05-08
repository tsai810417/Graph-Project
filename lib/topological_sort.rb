require_relative 'graph'
require 'byebug'
# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  top = []

  # sorted = vertices.select{ |v| v.in_edges.empty? }

  vertices.each do | v |
    if v.in_edges.empty?
      top.push(v)
    end
  end


  until top.empty?
    current = top.pop
    sorted << current
    arr = current.out_edges.dup
    arr.each do | e |
      v = e.to_vertex
      e.destroy!
      if v.in_edges.empty?
        top.push(v)
      end

    end
  end
  
  sorted.length == vertices.length ? sorted : []
end
