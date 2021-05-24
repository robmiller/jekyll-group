lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-group/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-group"
  spec.summary       = "Jekyll plugin for making posts part of a wider series"
  spec.description   = "Jekyll plugin for making posts part of a chronological series of posts that can be navigated through."
  spec.version       = JekyllGroup::VERSION
  spec.authors       = ["Rob Miller"]
  spec.email         = ["r@robm.me.uk"]
  spec.homepage      = "https://github.com/robmiller/jekyll-group"
  spec.licenses      = ["MIT"]
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!) }
  spec.require_paths = ["lib"]
  spec.add_dependency "jekyll", "~> 4.0"
  spec.add_development_dependency "rake", "~> 11.0"
end
