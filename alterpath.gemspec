# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alterpath/version'

Gem::Specification.new do |spec|
  spec.name          = "alterpath"
  spec.version       = Alterpath::VERSION
  spec.authors       = ["MOZGIII"]
  spec.email         = ["mike-n@narod.ru"]
  spec.description   = %q{Alterpath allows you to alter the system PATH on Windows in a flexible manner}
  spec.summary       = %q{Alterpath allows you to alter the system PATH on Windows in a flexible manner}
  spec.homepage      = "https://github.com/MOZGIII/alterpath"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "slop", ">= 3.4.7"
  spec.add_dependency "win-path-utils", ">= 0.2.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
