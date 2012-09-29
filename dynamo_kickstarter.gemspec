# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dynamo_kickstarter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas Henry"]
  gem.email         = ["nicholas.henry@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dynamo_kickstarter"
  gem.require_paths = ["lib"]
  gem.version       = DynamoKickstarter::VERSION

  gem.add_dependency 'rails', '3.2.8'
  gem.add_dependency 'heroku', '~>2.30.0'
end
