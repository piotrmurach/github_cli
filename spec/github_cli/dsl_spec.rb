# frozen_string_literal: true

RSpec.describe GithubCLI, 'dsl' do
  let(:object)    { described_class }
  let(:error_cli) { GithubCLI::GitHubError }

  before {
    allow(GithubCLI.ui).to receive(:error)
    allow(GithubCLI.ui).to receive(:debug)
  }

  after {
    allow(GithubCLI.ui).to receive(:error)
    allow(GithubCLI.ui).to receive(:debug)
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
