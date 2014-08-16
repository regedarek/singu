# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'singu/version'

Gem::Specification.new do |spec|
  spec.name          = "singu"
  spec.version       = Singu::VERSION
  spec.authors       = ["Darek Finster"]
  spec.email         = ["darek.finster@gmail.com"]
  spec.description   = %q{An opinionated Sinatra and Angular.js structure}
  spec.summary       = %q{Sinatra + Angular.js app generator}
  spec.homepage      = "http://github.com/regedarek/singu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency 'rake', '~> 10.3', '>= 10.3.2'
  spec.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  spec.add_development_dependency 'rspec-nc', '~> 0.1', '>= 0.1.1'
  spec.add_development_dependency 'rspec-legacy_formatters', '~> 1.0', '>= 1.0.0'
  spec.add_development_dependency "guard", "~> 2.6", '>= 2.6.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.3', '>= 4.3.1'
  spec.add_development_dependency 'pry', '~> 0.10', '>= 0.10.0'
  spec.add_development_dependency 'pry-remote', '~> 0.1', '>= 0.1.8'
  spec.add_development_dependency 'pry-nav', '~> 0.2', '>= 0.2.4'

  spec.add_dependency 'thor', '~> 0'
end
