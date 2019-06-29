# frozen_string_literal: true

RSpec.describe GithubCLI::API, '#configure' do
  let(:object) { described_class }

  before {
    allow(GithubCLI).to receive(:config).and_return(config)
  }
  subject { object.configure }

  context 'with default' do
    let(:config) { GithubCLI.new_config }

    it { expect(subject.adapter).to eql(:net_http) }

    it { expect(subject.ssl).to eql({}) }

    it { expect(subject.site).to eql('https://github.com') }

    it { expect(subject.endpoint).to eql('https://api.github.com') }

    it { expect(subject.oauth_token).to eql(nil) }
  end

  context 'with config values' do
    let(:config) {
      config = GithubCLI.new_config
      config.read(fixture_path('gcliconfig'), format: 'yml')
      config
    }

    it { expect(subject.adapter).to eql(:patron) }

    it { expect(subject.ssl).to eql({"verify" => false}) }

    it { expect(subject.site).to eql('https://test.com') }

    it { expect(subject.endpoint).to eql('https://api.test.com') }

    it { expect(subject.oauth_token).to eql('abc1234') }
  end
end
