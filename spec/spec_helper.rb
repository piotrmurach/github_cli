# frozen_string_literal: true

if ENV['COVERAGE'] || ENV['TRAVIS']
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ])

  SimpleCov.start do
    command_name 'spec'
    add_filter 'spec'
  end
end

require 'github_cli'

module Helpers
  def source_root
    File.join(File.dirname(__FILE__), '..', 'fixtures')
  end

  def dest_root
    File.join(File.dirname(__FILE__), '..', 'tmp')
  end

  def fixture(name)
    File.read(File.expand_path(File.join(source_root, name)))
  end

  def fixture_path(name='')
    File.expand_path File.join(File.dirname(__FILE__), '..', 'fixtures', name)
  end
end

RSpec.configure do |config|
  config.include(Helpers)
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

  failure_message do |block|
    "expected block to call exit(#{status_code}) but exit" +
    (actual.nil? ? " not called" : "(#{actual}) was called")
  end

  failure_message_when_negated do |block|
    "expected block not to call exit(#{status_code})"
  end

  description do
    "expect block to call exit(#{status_code})"
  end

  def supports_block_expectations?
    true
  end
end
