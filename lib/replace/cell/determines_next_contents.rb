class DeterminesNextContents
  def self.determine(old_contents, neighbors)
    case count_live_ones(neighbors)
    when 2 then old_contents.instance_of?(Cell) ? Cell.new : Nothing.new
    when 3 then Cell.new
    else 
      Nothing.new
    end
  end

  private

  def self.count_live_ones(neighbors)
    i = 0
    for point in neighbors 
      i += 1 if point.contents.instance_of?(Cell)
    end
    i
  end
end
