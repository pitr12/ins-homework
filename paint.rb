# simple pint fill function
# created by Peter Dubec on 1.10.2016
#
# run by ruby ./paint.rb

class Screen

  # initialize filled screen
  def self.init
    return [[0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
            [0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
            [0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
            [0, 4, 0, 0, 0, 2, 7, 7, 7, 7, 7, 7, 1],
            [0, 4, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
            [0, 4, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1],
            [0, 0, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 1],
            [0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 1]]
  end

  # function to print screen to console
  def self.print_screen(screen)
    rows = screen.size - 1
    cols = screen[0].size - 1
    (0..rows).each do |row|
      (0..cols).each do |col|
        print "#{screen[row][col]} "
      end
      puts ''
    end
    puts ''
  end

  #fill screen on position x,y and all neighbours with same value
  def self.fill(screen, x, y, color)
    original_color = screen[y][x]

    screen[y][x] = color

    #top neighbour
    if y > 0 && screen[y-1][x] == original_color
      fill(screen, x, y-1, color)
    end

    #bottom neighbour
    if y < screen.size - 1 && screen[y+1][x] == original_color
      fill(screen, x, y+1, color)
    end

    #left neighbour
    if x > 0 && screen[y][x-1] == original_color
      fill(screen, x-1, y, color)
    end

    #right neighbour
    if x < screen[0].size - 1 && screen[y][x+1] == original_color
      fill(screen, x+1, y, color)
    end

  end

end

screen = Screen.init
puts "screen"
Screen.print_screen(screen)

puts "fill(screen, 2, 1, 5)"
Screen.fill(screen, 2, 1, 5)
Screen.print_screen(screen)

puts "fill(screen, 0, 0, 3)"
Screen.fill(screen, 0, 0, 3)
Screen.print_screen(screen)

puts "fill(screen, 0, 0, 1)"
Screen.fill(screen, 0, 0, 1)
Screen.print_screen(screen)

puts "fill(screen, 12, 3, 9)"
Screen.fill(screen, 12, 3, 9)
Screen.print_screen(screen)