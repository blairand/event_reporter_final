# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_reporter/version'

Gem::Specification.new do |gem|
  gem.name          = "the_only_event_reporter_ever"
  gem.version       = EventReporter::VERSION
  gem.authors       = ["Blair Anderson"]
  gem.email         = ["blair81@gmail.com"]
  gem.description   = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  gem.summary       = "Crappy CSV Parser reads a CSV and can save it to other formats."
  gem.homepage      = "https://github.com/blairand/event_reporter_final"

  gem.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE.txt README.md)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.required_ruby_version = '>=1.9'
  gem.add_dependency 'nokogiri', '>= 1.5.6'
end
