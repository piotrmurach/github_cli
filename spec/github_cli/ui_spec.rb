# frozen_string_literal: true

RSpec.describe GithubCLI::UI do
  let(:prompt) { double(:prompt) }

  it "confirms message" do
    allow(prompt).to receive(:ok)
    ui = GithubCLI::UI.new(prompt)

    ui.confirm("done")

    expect(prompt).to have_received(:ok).with("done")
  end

  it "debugs the error message" do
    error = double(:error, message: "error",
                           class: 'Exception',
                           backtrace: ['line1', 'line2'])
    allow(prompt).to receive(:say)
    ui = GithubCLI::UI.new(prompt)

    ui.debug(error)

    expect(prompt).to have_received(:say).with("Exception: error\nline1\nline2")
  end
end
