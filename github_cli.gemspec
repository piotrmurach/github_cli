# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github_cli/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Piotr Murach"]
  spec.email         = [""]
  spec.description   = %q{CLI-based access to GitHub API v3}
  spec.summary       = %q{Full command line access to GitHub API v3}
  spec.homepage      = "http://github.com/peter-murach/github_cli"

  man_files         = Dir.glob("lib/github_cli/man/**/*")
  vendor_files      = Dir.glob("lib/github_cli/vendor/**/*")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.files         = `git ls-files`.split("\n") + man_files + vendor_files
  spec.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  spec.name          = "github_cli"
  spec.require_paths = ["lib"]
  spec.version       = GithubCLI::VERSION

  spec.add_dependency 'github_api', '~> 0.10.0'
  spec.add_dependency 'tty',        '~> 0.0.10'

  spec.add_development_dependency 'rspec', '2.13.0'
  spec.add_development_dependency 'aruba', '0.5.1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'communist'
  spec.add_development_dependency 'ronn', '0.7.3'
end
