lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "github_cli"
  spec.version       = GithubCLI::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["me@piotrmurach.com"]
  spec.summary       = %q{GitHub on your command line. Use your terminal, not the browser}
  spec.description   = %q{GitHub on your command line. Use your terminal, not the browser}
  spec.homepage      = "http://github.com/piotrmurach/github_cli"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*']
  spec.files        += Dir['bin/*', 'github_cli.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.executables   = %w(gcli)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'github_api', '~> 0.10.0'
  spec.add_dependency 'tty-config', '~> 0.3.2'
  spec.add_dependency 'tty-editor', '~> 0.5'
  spec.add_dependency 'tty-pager',  '~> 0.12'
  spec.add_dependency 'tty-prompt', '~> 0.19'
  spec.add_dependency 'tty-screen', '~> 0.7'
  spec.add_dependency 'tty-which',  '~> 0.4'

  spec.add_development_dependency 'bundler', '>= 1.5.0'
  spec.add_development_dependency 'rake', '< 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'aruba', '~> 0.14.10'
  spec.add_development_dependency 'communist', '~> 0.3.0'
end
