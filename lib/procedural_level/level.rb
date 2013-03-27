module ProceduralLevel
  class Level
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
end
