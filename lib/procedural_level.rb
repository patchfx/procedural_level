require "procedural_level/version"
require "perlin"
require "procedural_level/level"

module ProceduralLevel
  def self.generate(width, height)
    Level.new(width, height).build
  end
end
