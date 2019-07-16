# frozen_string_literal: true

RSpec.describe GithubCLI::API, '#gihtub_api' do
  before {
    described_class.send(:instance_variable_set, :@github_api, nil)
  }

  it 'sets up github api connection' do
    github_instance = double.as_null_object
    allow(Github).to receive(:new).and_return(github_instance)

    expect(described_class.github_api).to eql(github_instance)
  end

  it 'does not instantiate on subsequent calls' do
    described_class.github_api
    expect(Github).to receive(:new).exactly(0).times
    described_class.github_api
  end
end # GithubCLI::API
