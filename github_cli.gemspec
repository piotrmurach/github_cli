# -*- encoding: utf-8 -*-
require File.expand_path('../lib/github_cli/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Piotr Murach"]
  gem.email         = ["pmurach@gmail.com"]
  gem.description   = %q{CLI-based access to GitHub API v3}
  gem.summary       = %q{CLI-based access to GitHub API v3}
  gem.homepage      = "http://github.com/peter-murach/github_cli"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  gem.name          = "github_cli"
  gem.require_paths = ["lib"]
  gem.version       = GithubCLI::VERSION

  gem.add_dependency 'github_api', '~> 0.5.0'
  gem.add_dependency 'thor'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'aruba'
  gem.add_development_dependency 'rake'
end
