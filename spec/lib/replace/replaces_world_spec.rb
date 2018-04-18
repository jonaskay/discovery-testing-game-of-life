require 'replace/replaces_world'
require 'replace/keeps_time'
require 'replace/cell/replaces_cell'
require 'replace/outcome'
require 'replace/coordinates'
require 'replace/contents'
require 'values/world'
require 'values/mutable_world'

RSpec.describe ReplacesWorld do
  let(:keeps_time) { class_double('KeepsTime').as_stubbed_const }
  let(:replaces_cell) { class_double('ReplacesCell').as_stubbed_const }

  it "replaces one cell" do
    time_limit = instance_double('TimeLimit')
    allow(time_limit).to receive(:times_up?).and_return(false, true)
    allow(keeps_time).to receive(:keep).with(42).and_return(time_limit)
    world1 = MutableWorld.new
    next_contents = Contents.new
    outcome = Outcome.new(next_contents, [])
    coordinates = Coordinates.new(0, 0)
    allow(replaces_cell).to receive(:replace).with(coordinates, world1).and_return(outcome)

    result = described_class.replace(world1, 42)

    expect(result.at(coordinates)).to eq(next_contents)     
  end

  it "replaces two cell" do
    time_limit = instance_double('TimeLimit')
    allow(time_limit).to receive(:times_up?).and_return(false, false, true)
    allow(keeps_time).to receive(:keep).with(42).and_return(time_limit)
    world1 = MutableWorld.new
    next_contents = Contents.new
    neighbors = [Coordinates.new(50,50)]
    outcome = Outcome.new(next_contents, neighbors)
    coordinates = Coordinates.new(0, 0)
    allow(replaces_cell).to receive(:replace).with(coordinates, world1).and_return(outcome)
    next_contents2 = Contents.new 
    outcome2 = Outcome.new(next_contents2, [])
    allow(replaces_cell).to receive(:replace).with(Coordinates.new(50, 50), world1).and_return(outcome2)    

    result = described_class.replace(world1, 42)

    expect(result.at(coordinates)).to eq(next_contents)   
    expect(result.at(Coordinates.new(50,50))).to eq(next_contents2)  
  end
end
