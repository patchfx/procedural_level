require 'rubygems'
require 'texplay'
require 'fidgit'
require 'perlin'

include Gosu

require 'gosu'

class MyWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "My Gosu Window"
    @map = Map.generate(50)
  end

  def draw
    @map.tiles.each do |tile|
      draw_quad(
        tile.x, tile.y, tile.color,
        tile.x + 16, tile.y, tile.color,
        tile.x, tile.y + 16, tile.color,
        tile.x + 16, tile.y + 16, tile.color, 0
      )
    end
  end
end

class Tile
  attr_reader :x, :y, :color
  def initialize(x,y,color)
    @x = x
    @y = y
    @color = color
  end
end

class Map
  attr_reader :tiles
  def self.generate(size, step=0.1)
    new(size).build(step)
  end

  def initialize(size)
    @size = size
    @tiles = []
  end

  def build(step)
    width = @size
    @noise = Perlin::Generator.new 1, 0, 1
    @noise.chunk 0, 0, width, width, step do |n, x, y|
      intensity = ((n + 1) * 0.5) * 255
      puts intensity
      if intensity > 210
        color = Gosu::Color.rgba(255,255,255,255)
      elsif intensity > 180 && intensity < 210
        color = Gosu::Color.rgba(206,206,206,255)
      elsif intensity > 40 && intensity < 180
        color = Gosu::Color.rgba(0,255,0,255)
      else
        color = Gosu::Color.rgba(0,0,255,255)
      end
      @tiles << Tile.new(x.fdiv(step).round * 16, y.fdiv(step).round * 16, color)
    end
    self
  end
end

MyWindow.new.show
