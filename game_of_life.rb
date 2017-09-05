#Basic File

#Start of Game class
class Game
  attr_accessor :world, :seeds
  def initialize(world=World.new, seeds=[])
    @world = world
    @seeds = seeds

    seeds.each do |seed|
      world.cell_grid[seed[0]][seed[1]].alive = true
    end
  end
end
#End of Game class

#Start of World Class
class World
  attr_accessor :rows, :cols, :cell_grid
  def initialize(rows=3, cols=3)
    @rows = rows
    @cols = cols

    @cell_grid = Array.new(rows) do |row|
                  Array.new(cols) do |col|
                    Cell.new(col, row)
                  end
                end
  end

  def neighbours_around_cell(cell)

  end
end
#End of World Class

#Start of Cell Class
class Cell
  attr_accessor :alive, :x, :y
  def initialize(x=0, y=0)
    @alive = false
    @x = x
    @y = y
  end

  def alive?
    alive
  end
end
#End of Cell Class
