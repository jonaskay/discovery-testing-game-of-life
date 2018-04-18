require 'replace/cell/gathers_neighbors'
require 'replace/cell/determines_next_contents'
require 'replace/outcome'
require 'replace/coordinates'

class ReplacesCell
  def self.replace(coordinates, world)
    neighbors = GathersNeighbors.gather(coordinates, world)
    new_contents = DeterminesNextContents.determine(world.at(coordinates), neighbors)
    Outcome.new(new_contents, neighbors)
  end
end
