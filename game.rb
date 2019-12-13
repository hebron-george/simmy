#!/usr/bin/env ruby -w
require 'rubygems'
require 'gosu'
require 'pry'

# class SimmyScreen
#   attr_accessor :x, :y, :width, :height, :color
#
#   def initialize(window, x, y, width, height, color)
#     @x = x
#     @y = y
#     @width  = width
#     @height = height
#     @color  = color
#     binding.pry
#     @window = windows
#   end
# end

class Simmy
  attr_reader :current_sequence

  ELEMENTS = [:a, :b, :c, :d]

  def initialize
    setup_game!
  end

  def setup_game!
    @score = 0
    @current_sequence = [ELEMENTS.sample]
  end

  def check_at_index(index, value)
    value == current_sequence[index]
  end

  def increment!
    @current_sequence.append(ELEMENTS.sample)
  end
end

class Game < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Simmy Says"

    @background_image = Gosu::Image.new("assets/space.png", :tileable => true)
  end

  def update
    # called 60 times per second by default, and should contain the main
    # game logic, such as moving objects around, or testing for collisions.
  end

  def draw
    # usually called 60 times per second, but may be skipped for performance reasons.
    # It should contain code to redraw the whole scene, but no game logic.
    @background_image.draw(0,0,0)
  end
end

# Simmy.new.show
binding.pry