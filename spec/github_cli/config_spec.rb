require 'spec_helper'

describe GithubCLI::Config do
  let(:filename) { '.githubrc' }
  let(:config_name) { 'simple_config' }
  let(:path) { "/users/#{filename}" }

  context 'global' do
    let(:config) { GithubCLI::Config.new fixture_path(config_name) }

    before do
      File.stub(:open) { YAML.load fixture('simple_config') }
    end

    it 'returns config type' do
      GithubCLI.config = GithubCLI::Config.new filename
      GithubCLI.config.should be_a GithubCLI::Config
    end

    context 'array access' do
      it 'searches in commands' do
        config['issue-list'].should == { 'inputs' => 'ticket' }
      end
    end

    context '#fetch' do
      it 'finds value' do
        config.fetch('oauth_token').should == 'ad7f9asdf97as98df7as9fd7'
      end

      it 'uses default value' do
        config.fetch('unkown', 11).should == 11
      end

      it 'raises error' do
        expect {
          config.fetch('unkown')
        }.to raise_error(IndexError)
      end
    end

    context '#save' do
      let(:attrs) { {} }
      let(:cmd) { stub(:cmd, :namespace => 'repo', :name => 'create') }

      before do
        GithubCLI::Command.stub(:all) { [cmd] }
      end

      it 'saves config to yaml format' do
        File.stub(:open).and_yield filename
        YAML.should_receive(:dump).with(attrs, filename)
        config.save attrs
      end

      it 'retrieves api commands' do
        config.save attrs
        attrs.should have_key described_class::COMMAND_KEY
        attrs[described_class::COMMAND_KEY].should have_key 'repo-create'
      end

      it 'skips commands with no namespace' do
        cmd.stub(:namespace) { '' }
        config.save attrs
        attrs[described_class::COMMAND_KEY].should be_empty
      end

      it 'skips help commands' do
        cmd.stub(:name) { 'help' }
        config.save attrs
        attrs[described_class::COMMAND_KEY].should be_empty
      end
    end

    it "loads empty hash if config doesn't exist" do
      File.stub(:exists?) { false }
      config.load == {}
    end

    it "loads yaml config" do
      File.stub(:exists?) { true }
      File.stub(:open).and_yield filename
      YAML.should_receive(:load).with(filename)
      config.load
    end

    it 'defines absolute path' do
      config = GithubCLI::Config.new path
      config.path.should == path
    end

    it 'expands relative path' do
      config = GithubCLI::Config.new
      config.path.should == "#{ENV['HOME']}/#{filename}"
    end
  end

  context 'local' do
  end

end # GithubCLI::Config
