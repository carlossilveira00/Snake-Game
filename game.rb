require 'gosu'
require_relative "snake"
require_relative "food"

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Snake Game"
    @snake = Snake.new
    @food = Food.popup

    @refresh_rate = 0.1
    @last_timestamp = Time.now
  end

  def update
    return if (Time.now - @last_timestamp) < @refresh_rate
    # ...
    update_snake_direction
    @snake.move

    if @food.eaten_by?(@snake)
      @snake.grow
      accelarate
      @food = Food.popup
    end

    if @snake.dead?
      sleep(3)
      @snake = Snake.new
      @refresh_rate = 0.1
    end

    @last_timestamp = Time.now
  end

  def draw
    @snake.draw
    @food.draw
  end

  private

  def accelarate
    @refresh_rate -= 0.005
  end

  def update_snake_direction
    if Gosu.button_down?(Gosu::KB_RIGHT) && @snake.direction != "left"
      @snake.direction = "right"
    elsif Gosu.button_down?(Gosu::KB_LEFT) && @snake.direction != "right"
      @snake.direction = "left"
    elsif Gosu.button_down?(Gosu::KB_UP) && @snake.direction != "down"
      @snake.direction = "up"
    elsif Gosu.button_down?(Gosu::KB_DOWN) && @snake.direction != "up"
      @snake.direction = "down"
    end
  end
end

Tutorial.new.show
