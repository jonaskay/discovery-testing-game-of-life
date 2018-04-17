require 'simulates_conway'
require 'world'
require 'generates_seed_world'
require 'replaces_world'
require 'outputs_world'

RSpec.describe 'SimulatesConway' do 
  let(:subject) { SimulatesConway }
  let(:generates_seed_world) { class_double('GeneratesSeedWorld').as_stubbed_const }
  let(:replaces_world) { class_double('ReplacesWorld').as_stubbed_const }
  let(:outputs_world) { class_double('OutputsWorld').as_stubbed_const }

  it "outputs a world after 0 generations" do
    seed_world = World.new
    allow(generates_seed_world).to receive(:generate) { seed_world }

    expect(outputs_world).to receive(:output).with(seed_world)

    subject.simulate(0, 1337)
  end 

  it "outputs a world after 1 generation" do 
    seed_world = World.new
    allow(generates_seed_world).to receive(:generate).and_return(seed_world)
    world2 = World.new 
    allow(replaces_world).to receive(:replace).with(seed_world, 1337).and_return(world2)

    expect(outputs_world).to receive(:output).with(seed_world)
    expect(outputs_world).to receive(:output).with(world2)

    subject.simulate(1, 1337)
  end
end 
