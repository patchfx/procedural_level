require 'spec_helper'

describe ProceduralLevel do
  describe '#generate' do
    it 'generates a new level' do
      ProceduralLevel.generate(10,10).should be_an_instance_of(ProceduralLevel::Level)
    end
  end
end
