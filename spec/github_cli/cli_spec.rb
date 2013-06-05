require 'spec_helper'

describe GithubCLI::CLI do
  let(:object) { described_class }
  let(:config) { stub(:config).as_null_object }
  let(:ui) { stub(:ui) }

  before {
    GithubCLI.stub(:ui).and_return(ui)
    GithubCLI.stub(:config).and_return(config)
  }

  context 'whoami' do
    let(:config) { {'user.login' => nil } }

    it 'checks config for user info' do
      ui.should_receive(:info).with(/Not authed/)
      subject.invoke 'whoami', []
    end
  end

  context 'init' do
    it 'confirms config creation' do
      ui.should_receive(:confirm).with(/Writing new configuration file/)
      File.stub(:exists?).and_return(false)
      subject.invoke "init", []
    end

    it 'aborts if config already exists' do
      ui.should_receive(:error).with(/Not overwritting existing/)
      File.stub(:exists?).and_return(true)
      expect { subject.invoke "init", [] }.to raise_error(SystemExit)
    end

    it 'allows to overwrite existing config' do
      ui.should_receive(:confirm).with(/Writing new configuration file/)
      File.stub(:exists?).and_return(true)
      subject.invoke "init", [], {:force => true}
    end
  end

  context 'config' do
    let(:name) { 'core.editor' }

    before {
      File.stub(:exists?).and_return(true)
      GithubCLI::Terminal.stub(:line)
    }

    it 'aborts without config file' do
      ui.should_receive(:error).with(/Configuration file does not exist/)
      File.stub(:exists?).and_return(false)
      expect { subject.invoke "config", [] }.to raise_error(SystemExit)
    end

    it 'prints option for list flag' do
      GithubCLI::Terminal.should_receive(:print_config).with(name)
      subject.invoke "config", [name], {:list => true}
    end

    it 'print whole config without parameters' do
      GithubCLI::Terminal.should_receive(:print_config)
      subject.invoke "config", []
    end
  end
end
