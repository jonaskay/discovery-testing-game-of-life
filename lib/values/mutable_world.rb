require 'values/world'

class MutableWorld < World
  def at(coordinates)
    self.population[coordinates]
  end

  def set(coordinates, contents)
    self.population[coordinates] = contents 
  end
end
