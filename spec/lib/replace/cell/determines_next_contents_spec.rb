require 'replace/cell/determines_next_contents'
require 'values/cell'
require 'values/point'
require 'values/nothing'

RSpec.describe DeterminesNextContents do
  def live_neighbors(number)
    neighbors = []
    i = 0
    while i < 9
      contents = i < number ? Cell.new : Nothing.new
      neighbors.push(Point.new(contents, nil))
      i += 1
    end 
    neighbors
  end 

  it "kills a live cell with zero live cells" do 
    old_contents = Cell.new
    neighbors = live_neighbors(0)

    result = described_class.determine(old_contents, neighbors)

    expect(result).to be_instance_of(Nothing)
  end

  it "keeps a live cell with two live neighbors alive" do 
    old_contents = Cell.new
    neighbors = live_neighbors(2)

    result = described_class.determine(old_contents, neighbors)

    expect(result).to be_instance_of(Cell)
  end

  it "keeps a live cell alive" do 
    expect(described_class.determine(Cell.new, live_neighbors(0))).to be_instance_of(Nothing)
    expect(described_class.determine(Cell.new, live_neighbors(1))).to be_instance_of(Nothing)
    expect(described_class.determine(Cell.new, live_neighbors(2))).to be_instance_of(Cell)
    expect(described_class.determine(Cell.new, live_neighbors(3))).to be_instance_of(Cell)
    expect(described_class.determine(Cell.new, live_neighbors(4))).to be_instance_of(Nothing)
    expect(described_class.determine(Cell.new, live_neighbors(5))).to be_instance_of(Nothing)
    expect(described_class.determine(Cell.new, live_neighbors(6))).to be_instance_of(Nothing)
    expect(described_class.determine(Cell.new, live_neighbors(7))).to be_instance_of(Nothing)
    expect(described_class.determine(Cell.new, live_neighbors(8))).to be_instance_of(Nothing)
  end

  it "resurrects a dead cell" do 
    expect(described_class.determine(Nothing.new, live_neighbors(0))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(1))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(2))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(3))).to be_instance_of(Cell)
    expect(described_class.determine(Nothing.new, live_neighbors(4))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(5))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(6))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(7))).to be_instance_of(Nothing)
    expect(described_class.determine(Nothing.new, live_neighbors(8))).to be_instance_of(Nothing)
  end
end
