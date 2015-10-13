require 'pry'
require 'matrix'
class Player
   attr_accessor :name
end

class HumanPlayer < Player
  def initialize name = "Dave"
    @name = name
  end
end

class ComputerPlayer < Player
  def initialize
    @name = "HAL 9000"  
  end
end

class Ship
  attr_reader :length

  def initialize length
    @length = length
  end

  def self.generate_cooridinates current, length, axis
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

  def place x,y,axis
    return false if @origin
    @origin = Vector[x, y]
    @axis = axis
    @cooridinates = Ship.generate_cooridinates(@origin, @length, @axis)
  end

  def covers? x, y
    @cooridinates.include?(Vector[x,y]) ? true : false
  end

  def overlaps_with? ship
    
  end

end


