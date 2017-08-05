# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "lecture/version"

Gem::Specification.new do |spec|
  spec.name          = "lecture"
  spec.version       = Lecture::VERSION
  spec.authors       = ["npezza93"]
  spec.email         = ["npezza93@gmail.com"]

  spec.summary       = "Terminal Slideshow"
  # spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["lecture"]
  spec.require_paths = ["lib"]

  spec.add_dependency "pygments.rb"
  spec.add_dependency "colorize"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
end
