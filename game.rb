#!/usr/bin/env ruby -w
require 'rubygems'
require 'gosu'

class Floor
  attr_accessor :x, :y, :width, :height, :color

  def initialize(window, x, y, width, height, color)
    @x = x
    @y = y
    @width  = width
    @height = height
    @color  = color
    @window = windows
  end
end

class Game < Gosu::Window
  def initialize
    super 1280, 480
    self.caption = "Simmy Says"

    @count = 0
    @count_text = Gosu::Font.new(100)
    @score = 0
    @score_text = Gosu::Font.new(100)
    @click_count = 0

    @background_image = Gosu::Image.new("assets/space.png", :tileable => true)
  end

  def update
    # called 60 times per second by default, and should contain the main
    # game logic, such as moving objects around, or testing for collisions.
    @count = Random.rand(5000)
  end

  def draw
    # usually called 60 times per second, but may be skipped for performance reasons.
    # It should contain code to redraw the whole scene, but no game logic.
    @background_image.draw(0,0,0)
    @background_image.draw(640,0,0)
    @count_text.draw_text("Try yer' luck: #{@count}", 10, 10, 0)
    @score_text.draw_text("Score: #{@score}", 10, 210, 0)
  end

  def button_down(id)
    case id
      when Gosu::KbEscape
        close
      when Gosu::MsLeft
        update_score!
    end
  end

  private
    def update_score!
      return if @click_count > 4
      @click_count += 1
      @score += @count
    end

end

Game.new.show
