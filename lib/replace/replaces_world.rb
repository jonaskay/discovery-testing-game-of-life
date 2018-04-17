require 'replace/keeps_time'

class ReplacesWorld
  def self.replace(old_world, time_limit_in_ms)
    new_world = MutableWorld.new
    time_limit = KeepsTime.keep(time_limit_in_ms)
    cells_to_replace = [Coordinates.new(0,0)]
    while !cells_to_replace.empty? && !time_limit.times_up? 
      coordinates = cells_to_replace.shift
      outcome = ReplacesCell.replace(coordinates.x, coordinates.y, old_world)
      new_world.set(coordinates.x, coordinates.y, outcome.next_contents)
      cells_to_replace.push(*outcome.neighbors)
    end
    new_world
  end
end
