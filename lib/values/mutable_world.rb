require 'values/world'

class MutableWorld < World
  def at(coordinates)
    self.population[[coordinates.x, coordinates.y]]
  end

  def set(x, y, contents)
    self.population[[x, y]] = contents 
  end
end
