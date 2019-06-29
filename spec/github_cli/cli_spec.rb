# frozen_string_literal: true

RSpec.describe GithubCLI::CLI do
  let(:object) { described_class }
  let(:config) { double(:config).as_null_object }
  let(:ui) { double(:ui) }

  before do
    allow(GithubCLI).to receive(:ui).and_return(ui)
    allow(GithubCLI).to receive(:new_config).and_return(config)
    allow(GithubCLI).to receive(:config).and_return(config)
  end

  context '#whoami' do
    it 'checks config for user info' do
      allow(config).to receive(:fetch).with('user.login').and_return(nil)
      allow(ui).to receive(:info)

      subject.invoke 'whoami', []

      expect(ui).to have_received(:info).with(/Not authed/, "\n")
    end
  end

  context '#init' do
    it 'confirms config creation' do
      allow(File).to receive(:exists?).and_return(false)
      allow(ui).to receive(:confirm)

      subject.invoke "init", []

      expect(ui).to have_received(:confirm).with(/Writing new configuration file/, "\n")
    end

    it 'aborts if config already exists' do
      allow(ui).to receive(:error)
      allow(File).to receive(:exists?).and_return(true)

      expect { subject.invoke "init", [] }.to raise_error(SystemExit)
      expect(ui).to have_received(:error).with(/Not overwritting existing/, "\n")
    end

    it 'allows to overwrite existing config' do
      allow(File).to receive(:exists?).and_return(true)
      allow(ui).to receive(:confirm)

      subject.invoke "init", [], {:force => true}

      expect(ui).to have_received(:confirm).with(/Writing new configuration file/, "\n")
    end
  end

  context '#config' do
    let(:name) { 'core.editor' }

    before {
      allow(ui).to receive(:info)
      allow(config).to receive(:exist?).and_return(true)
    }

    it 'aborts without config file' do
      allow(ui).to receive(:error).with(/Configuration file does not exist/)
      allow(config).to receive(:exist?).and_return(false)

      expect { subject.invoke "config", [] }.to raise_error(SystemExit)
    end

    it 'prints option for list flag' do
      allow(GithubCLI::Terminal).to receive(:print_config).with(name)

      subject.invoke "config", [name], {:list => true}

      expect(GithubCLI::Terminal).to have_received(:print_config)
    end

    it 'print whole config without parameters' do
      allow(GithubCLI::Terminal).to receive(:print_config)

      subject.invoke "config", []

      expect(GithubCLI::Terminal).to have_received(:print_config)
    end
  end
end
