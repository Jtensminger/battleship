
class Ship
  attr_reader :length, :origin, :axis

  def initialize length
    @length = length
    @holes = []
  end

  def self.generate_coordinates current, length, axis
    cooridinates = []
    if axis
      delta = Vector[1, 0]
    else
      delta = Vector[0, 1]
    end
    length.times do
        cooridinates << current
        current += delta
    end
    cooridinates
  end

  def place x, y, axis
    return false if @origin
    @origin = Vector[x, y]
    @axis = axis
    @coordinates = Ship.generate_coordinates(@origin, @length, @axis)
  end

  def covers? x, y
    @coordinates.include?(Vector[x,y])
  end

  def overlaps_with? ship
    @coordinates.find {|coor| ship.covers? coor[0], coor[1]}
  end

  def fire_at x, y
     if covers? x, y
        @holes << Vector[x,y]
        return true
     end
     false
  end

  def sunk?
    return false if @coordinates.nil?
    @coordinates.length == @holes.length
  end
end