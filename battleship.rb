
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
  attr_reader :length, :x, :y, :horizontal
  
  def initialize length
    @length = length
  end

  def place x, y, horizontal
    @x = x
    @y = y
    @horizontal = horizontal
  end

  def covers? x, y
    x_cur, y_cur = @x, @y

    @length.times do
      if self.horizontal
        if x_cur == x && y == y_cur 
          return true
        end   
        x_cur += 1 
      else
        if x_cur == x && y == y_cur 
          return true
        end
        y_cur += 1
      end
    end
    false
  end



end

