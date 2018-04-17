require 'generates_seed_world'
require 'replace/replaces_world'
require 'outputs_world'

class SimulatesConway
  def self.simulate(generations, time_limit_in_ms)
    world = GeneratesSeedWorld.generate
    
    i = 0
    while i < generations 
      OutputsWorld.output(world)
      world = ReplacesWorld.replace(world, time_limit_in_ms)
      i += 1
    end
    OutputsWorld.output(world)
  end
end
