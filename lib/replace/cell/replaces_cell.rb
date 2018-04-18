require 'replace/cell/gathers_neighbors'
require 'replace/cell/determines_next_contents'
require 'replace/outcome'
require 'replace/coordinates'

class ReplacesCell
  def self.replace(x, y, world)
    neighbors = GathersNeighbors.gather(x, y, world)
    new_contents = DeterminesNextContents.determine(world.at(Coordinates.new(x, y)), neighbors)
    Outcome.new(new_contents, neighbors)
  end
end
