require 'spec_helper'

describe GithubCLI::Config do
  let(:filename) { '.githubrc' }
  let(:config_name) { 'simple_config' }
  let(:path) { "/users/#{filename}" }

  context 'global' do
    let(:config) { GithubCLI::Config.new fixture_path }

    before do
      config.stub(:global_options_file) { fixture_path(config_name) }
      File.stub(:open) { YAML.load fixture('simple_config') }
    end

    it 'returns config type' do
      GithubCLI.config = GithubCLI::Config.new filename
      GithubCLI.config.should be_a GithubCLI::Config
    end

    context 'array access' do
      it 'returns value for the key' do
        config['auth.basic'].should == 'login:password'
      end

      it 'searches in commands' do
        config['issue.list'].should == { 'title' => 'ticket' }
      end

      it 'returns nil for missing key' do
        config['non-existent'].should be_nil
      end
    end

    context '#fetch' do
      it 'finds value' do
        config.fetch('auth.token').should == 'ad7f9asdf97as98df7as9fd7'
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
        File.stub(:open)
      end

      it 'saves config to yaml format' do
        File.stub(:open).and_yield filename
        YAML.should_receive(:dump).with(attrs, filename)
        config.save attrs
      end

      it 'retrieves api commands' do
        config.save attrs
        attrs.should have_key 'commands.repo.create'
      end

      it 'skips commands with no namespace' do
        cmd.stub(:namespace) { '' }
        config.save attrs
        attrs.keys.should be_empty
      end

      it 'skips help commands' do
        cmd.stub(:name) { 'help' }
        config.save attrs
        attrs.keys.should be_empty
      end
    end

    context "#load" do
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
    end

    context "#path" do
      it 'looks for local config file' do
        root = "/users/"
        File.stub(:exists?) { true }
        config = GithubCLI::Config.new root
        config.path.to_s.should == "#{root}/.githubrc"
      end

      it 'reads global file if local is missing ' do
        File.stub(:exists?) { false }
        config = GithubCLI::Config.new path
        config.path.to_s.should == "#{ENV['HOME']}/#{filename}"
      end
    end
  end

  context 'local' do
  end

end # GithubCLI::Config
