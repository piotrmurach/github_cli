# encoding: utf-8

require 'spec_helper'

describe GithubCLI, 'dsl' do
  let(:object)    { described_class }
  let(:error_cli) { GithubCLI::GitHubError }

  before {
    GithubCLI.ui.stub(:error)
    GithubCLI.ui.stub(:debug)
  }

  after {
    GithubCLI.ui.unstub(:error)
    GithubCLI.ui.unstub(:debug)
  }

  context 'on_error' do
    it "handles internal cli errors" do
      expect { object.on_error { raise error_cli } }.to exit_with_code(11)
    end

    it "handles interrupts" do
      expect { object.on_error { raise Interrupt } }.to exit_with_code(1)
    end

    it "handles fatal exceptions" do
      expect { object.on_error { raise Exception } }.to exit_with_code(1)
    end
  end
end
