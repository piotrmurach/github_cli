require 'spec_helper'

describe GithubCLI::API do
  context '#github_api' do
    before {
      described_class.send(:instance_variable_set, :@github_api, nil)
    }

    it 'sets up github api connection' do
      github_instance = stub.as_null_object
      Github.should_receive(:new).and_return github_instance
      expect(described_class.github_api).to eql(github_instance)
    end

    it 'does not instantiate on subsequent calls' do
      described_class.github_api
      Github.should_receive(:new).exactly(0).times
      described_class.github_api
    end
  end
end # GithubCLI::API
