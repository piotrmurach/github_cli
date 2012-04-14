require 'spec_helper'

describe GithubCLI::API do
  context '#github_api' do
    before(:each) { described_class.send(:class_variable_set, :@@api, nil) }

    it 'sets up github api connection' do
      github_instance = stub.as_null_object
      Github.should_receive(:new).and_return github_instance
      described_class.github_api.should == github_instance
    end

    it 'does not instantiate on subsequent calls' do
      described_class.github_api
      Github.should_receive(:new).exactly(0).times
      described_class.github_api
    end
  end
end # GithubCLI::API
