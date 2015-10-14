class Grid

  def has_ship_on? x,y
    false
  end

  def display
    row = []
    puts header
    puts seperator
    ['A','B','C','D','E','F','G','H','I','J'].each do |letter|
      puts "#{letter} |   |   |   |   |   |   |   |   |   |   |"
    end
    puts seperator
  end

  def header
    "    1   2   3   4   5   6   7   8   9   10"
  end

  def seperator
    "  -----------------------------------------"
  end
end