# encoding: utf-8

require 'spec_helper'

Shell = Class.new do
  def say(*args)
    args.first
  end
end

describe GithubCLI::UI do
  let(:shell)   { Shell.new }
  let(:message) { "error" }
  let(:object)  { described_class.new(shell) }

  subject { object }

  it "confirms message" do
    expect(object.confirm(message)).to eql(message)
  end

  it "debugs the error message" do
    error = double(:error, message: message,
                           class: 'Exception',
                           backtrace: ['line1', 'line2'])
    expect(object.debug(error)).to eql("Exception: error\nline1\nline2")
  end
end
