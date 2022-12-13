class Food
  GRID_SIZE = 20
  def initialize(x, y)
    @x = x
    @y = y
  end

  def self.popup
    x = rand(0..GRID_SIZE) * GRID_SIZE
    y = rand(0..GRID_SIZE) * GRID_SIZE

    Food.new(x, y)
  end

  def eaten_by?(snake)
    snake.x == @x && snake.y == @y
  end

  def draw
    Gosu.draw_rect(@x, @y, GRID_SIZE, GRID_SIZE, Gosu::Color::RED)
  end
end
