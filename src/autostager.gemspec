lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'English'
require 'autostager/version'

Gem::Specification.new do |spec|
  spec.name          = 'puppet-autostager'
  spec.version       = Autostager::VERSION
  spec.authors       = ['Paul Morgan']
  spec.email         = ['jumanjiman@gmail.com']
  spec.description   = 'Create a puppet enviroment for each pull request'
  spec.summary       = 'Create a puppet enviroment for each pull request'
  spec.homepage      = 'https://github.com/jumanjiman/autostager'
  spec.license       = 'MIT'

  spec.files         = `find bin/ lib/ -type f`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)\/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0', '<= 4.0'
  spec.add_development_dependency 'rspec-core'
  spec.add_development_dependency 'rspec-expectations'
  spec.add_development_dependency 'rspec-mocks'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'thor'

  spec.add_dependency 'json'
  spec.add_dependency 'octokit', '~> 3.0'
end
