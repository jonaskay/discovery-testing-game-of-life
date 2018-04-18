require 'replace/cell/replaces_cell'
require 'replace/contents'
require 'values/mutable_world'
require 'values/point'

RSpec.describe ReplacesCell do
  let(:gathers_neighbors) { class_double('GathersNeighbors').as_stubbed_const }
  let(:determines_next_contents) { class_double('DeterminesNextContents').as_stubbed_const }

  it "" do 
    world = MutableWorld.new()
    old_contents = Contents.new
    world.set(1337, 1337, old_contents)
    neighbors = []
    allow(gathers_neighbors).to receive(:gather).with(1337, 1337, world).and_return(neighbors)
    new_contents = Contents.new
    allow(determines_next_contents).to receive(:determine).with(old_contents, neighbors).and_return(new_contents)

    result = described_class.replace(1337, 1337, world)

    expect(result.neighbors).to eq(neighbors)
    expect(result.next_contents).to eq(new_contents)
  end
end
