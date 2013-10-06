require 'rubygems'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'github_cli'

RSpec.configure do |config|
  config.order = :rand
end

RSpec::Matchers.define :exit_with_code do |status_code|
  actual = nil

  match do |block|
    begin
      block.call
    rescue SystemExit => e
      actual = e.status
    end
    actual and actual == status_code
  end

  failure_message_for_should do |block|
    "expected block to call exit(#{status_code}) but exit" +
    (actual.nil? ? " not called" : "(#{actual}) was called")
  end

  failure_message_for_should_not do |block|
    "expected block not to call exit(#{status_code})"
  end

  description do
    "expect block to call exit(#{status_code})"
  end
end

def fixture(name)
  File.read File.expand_path File.join(File.dirname(__FILE__), '..', 'fixtures', name)
end

def fixture_path(name='')
  File.expand_path File.join(File.dirname(__FILE__), '..', 'fixtures', name)
end
