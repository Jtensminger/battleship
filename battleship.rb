require 'pry'
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
  attr_accessor :length, :x, :y, :horizontal, :taken_places, :count
  
  def initialize length
    @length = length
    @taken_places = []
    @count = 0
  end

  def place x, y, horizontal
    @horizontal = horizontal
    @count += 1
    return false if taken_places.include?([x,y]) || count > 1
    @x = x 
    @y = y
    
  end

  def covers? x, y
    x_cur, y_cur = @x, @y
    @length.times do
      if self.horizontal
        if x_cur == x && y == y_cur
          taken_places << [x_cur,y_cur]
          return true
        end
        x_cur += 1 
      else
        if x_cur == x && y == y_cur 
          taken_places << [x_cur,y_cur]
          return true
        end
        y_cur += 1
      end
    end
    false
  end

  def overlaps_with? ship2
   return true if self.covers?(ship2.x,ship2.y)
   return false
  end

  def fire_at x, y
    return true if self.x == x && self.y == y
    return false
  end

  def sunk?
    
  end








  
end

