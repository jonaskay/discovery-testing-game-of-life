class Outcome
  attr_accessor :next_contents, :neighbors
  
  def initialize(contents, neighbors)
    self.next_contents = contents 
    self.neighbors = neighbors
  end
end
