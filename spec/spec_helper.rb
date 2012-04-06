require 'rubygems'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'github_cli'

RSpec.configure do |config|
  config.order = :rand
end

def fixture(name)
  File.read File.expand_path File.join(File.dirname(__FILE__), '..', 'fixtures', name)
end

def fixture_path(name)
  File.expand_path File.join(File.dirname(__FILE__), '..', 'fixtures', name)
end
