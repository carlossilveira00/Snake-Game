class Snake
  GRID_SIZE = 20
  attr_reader :x, :y
  attr_accessor :direction

  def initialize
    @x = GRID_SIZE
    @y = GRID_SIZE
    @tail = []
    @tail_size = 0

    @direction = "right"
  end

  def draw
    Gosu.draw_rect(@x, @y, GRID_SIZE, GRID_SIZE, Gosu::Color::WHITE)
    @tail.each do |quad|
      Gosu.draw_rect(quad[0], quad[1], GRID_SIZE, GRID_SIZE, Gosu::Color::WHITE)
    end

  end

  def grow
    @tail_size += 1
  end

  def dead?
    (@x.negative? || @x > 640) || (@y.negative? || @y > 480) || @tail.include?([@x, y])
  end

  def move
    @tail.unshift([@x, @y])
    @tail = @tail.first(@tail_size)

    case @direction
    when "right"
      @x += GRID_SIZE
    when "left"
      @x -= GRID_SIZE
    when "down"
      @y += GRID_SIZE
    when "up"
      @y -= GRID_SIZE
    end
  end
end
