require 'spec_helper'

describe GithubCLI::Config do
  let(:filename) { '.githubrc' }
  let(:path) { "/users/#{filename}" }

  context 'global' do
    let(:config) { GithubCLI::Config.new filename }

    it 'returns config type' do
      GithubCLI.config = GithubCLI::Config.new filename
      GithubCLI.config.should be_a GithubCLI::Config
    end

    it 'saves config to yaml format' do
      attrs = stub
      File.stub(:open).and_yield filename
      YAML.should_receive(:dump).with(attrs, filename)
      config.save attrs
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
      config.path.should == "#{ENV['HOME']}/#{filename}"
    end
  end

  context 'local' do
  end

end # GithubCLI::Config
