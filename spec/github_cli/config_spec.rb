require 'spec_helper'

describe GithubCLI::Config do

  context '#config' do
    it 'sets global config' do
      instance = stub
      described_class.stub(:new) { instance }
      GithubCLI.should_receive(:const_set).with(:CONFIG, instance)
      described_class.config
    end
    it 'returns config type' do
      described_class.config.should be_a GithubCLI::Config
    end
  end

end # GithubCLI::Config
