lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "github_cli"
  spec.version       = GithubCLI::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["me@piotrmurach.com"]
  spec.description   = %q{CLI-based access to GitHub API v3}
  spec.summary       = %q{Full command line access to GitHub API v3}
  spec.homepage      = "http://github.com/piotrmurach/github_cli"
  spec.license       = "MIT"

  man_files          = Dir.glob("lib/github_cli/man/**/*")
  spec.executables   = %w(gcli)
  spec.files         = `git ls-files`.split("\n")
  spec.files         += man_files
  spec.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'github_api', '~> 0.10.0'
  spec.add_dependency 'tty-editor', '~> 0.5'
  spec.add_dependency 'tty-pager',  '~> 0.12'
  spec.add_dependency 'tty-prompt', '~> 0.19'
  spec.add_dependency 'tty-screen', '~> 0.7'
  spec.add_dependency 'tty-which',  '~> 0.4'

  spec.add_development_dependency 'bundler', '>= 1.5.0'
  spec.add_development_dependency 'rake', '< 1.0'
  spec.add_development_dependency 'rspec', '2.99.0'
  spec.add_development_dependency 'aruba', '0.5.1'
  spec.add_development_dependency 'communist', '~> 0.3.0'
end
