# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teaspoon/bundle/version'

Gem::Specification.new do |spec|
  spec.name          = "teaspoon-bundle"
  spec.version       = Teaspoon::Bundle::VERSION
  spec.authors       = ["Bouke van der Bijl"]
  spec.email         = ["bouke@shopify.com"]

  spec.summary       = %q{Dynamically create a test bundle for Teaspoon that contains all the files}
  spec.description   = %q{This gem is boot partial for Teaspoon that puts all the test files into a single bundle}
  spec.homepage      = "https://github.com/Shopify/teaspoon-bundle"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "teaspoon"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "minitest", "~> 5"
end
