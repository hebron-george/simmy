#!/usr/bin/env ruby -w
require 'rubygems'
require 'gosu'

class SimmyScreen
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

Game.new.show
