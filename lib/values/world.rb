class World 
  attr_accessor :population

  def initialize
    self.population = {}
  end

  def at(coordinates)
    raise 'Called abstract method: at'
  end
end
