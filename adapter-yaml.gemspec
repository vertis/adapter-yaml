# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adapter/yaml/version'

Gem::Specification.new do |spec|
  spec.name          = "adapter-yaml"
  spec.version       = Adapter::YAML::VERSION
  spec.authors       = ["Luke Chadwick"]
  spec.email         = ["me@vertis.io"]
  spec.description   = %q{Add yaml support to adapter}
  spec.summary       = %q{Add yaml support to adapter}
  spec.homepage      = "https://github.com/vertis/adapter-yaml"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_dependency "adapter", "~> 0.7.0"
end
