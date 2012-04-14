require 'spec_helper'

describe GithubCLI::Helpers do
  subject { described_class }

  it 'throws error if config file does not exist' do
    subject.stub(:find_configfile) { nil }
    expect {
      subject.default_configfile
    }.to raise_error(GithubCLI::ConfigFileNotFound)
  end

  it 'finds current directory' do
    current = File.expand_path('../../../', __FILE__)
    described_class.find_configfile.should == current
  end
end
