# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geonames/version'

Gem::Specification.new do |s|
  s.name        = "geonames-wrapper"
  s.version     = GeoNames::VERSION
  s.summary     = "GeoNames JSON Web Service Wrapper"
  s.description = "Bare-metal wrapper for GeoNames JSON Web Service API. Simple and effective."

  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = ">= 1.9.0"

  s.authors     = ["Michael Fellinger",     "Marcello Barnaba"]
  s.email       = ["m.fellinger@gmail.com", "vjt@openssl.it"  ]
  s.homepage    = "http://github.com/vjt/geonames"

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency 'addressable', '~> 2.3'

  s.add_development_dependency "bundler", "~> 1.11"
  s.add_development_dependency "yard"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "pry"
  s.add_development_dependency "simplecov"
end
