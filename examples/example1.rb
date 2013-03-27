require_relative '../lib/procedural_level'
require 'gosu'

class MyWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    self.caption = "My Gosu Window"
    @level = ProceduralLevel.generate(50)
  end

  def draw
    @level.tiles.each do |tile|
      draw_quad(
        tile.x, tile.y, tile.color,
        tile.x + 16, tile.y, tile.color,
        tile.x, tile.y + 16, tile.color,
        tile.x + 16, tile.y + 16, tile.color, 0
      )
    end
  end
end

MyWindow.new.show
