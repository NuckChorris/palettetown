# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'palettetown/version'

Gem::Specification.new do |spec|
  spec.name          = "palettetown"
  spec.version       = Palettetown::VERSION
  spec.authors       = ["Peter Lejeck"]
  spec.email         = ["peter.lejeck@gmail.com"]
  spec.description   = %q{A simple ruby DSL for writing vim schemes}
  spec.summary       = %q{A simple ruby DSL for writing vim schemes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "thor"
end
