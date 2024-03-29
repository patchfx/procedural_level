# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'procedural_level/version'

Gem::Specification.new do |spec|
  spec.name          = "procedural_level"
  spec.version       = ProceduralLevel::VERSION
  spec.authors       = ["Richard Patching"]
  spec.email         = ["richard@justaddpixels.com"]
  spec.description   = %q{Procedural level generation}
  spec.summary       = %q{Procedural level generation}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency 'gosu'
  spec.add_dependency 'texplay'
  spec.add_dependency 'perlin'
end
