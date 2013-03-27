require "perlin"
require "gosu"
require "procedural_level/version"
require "procedural_level/level"
require "procedural_level/tile"

module ProceduralLevel
  def self.generate(size)
    Level.generate(size)
  end
end
