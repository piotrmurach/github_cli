# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Search do
  let(:format) { {'format' => 'table'} }
  let(:api_class) { GithubCLI::Search }

  it "invokes search:issue" do
    expect(api_class).to receive(:issue).with({"q" => "query"}, format)
    subject.invoke "search:issue", ["query"]
  end

  it "invokes search:repo" do
    expect(api_class).to receive(:repo).with({"q" => "query"}, format)
    subject.invoke "search:repo", ["query"]
  end

  it "invokes search:user" do
    expect(api_class).to receive(:user).with({"q" => "query"}, format)
    subject.invoke "search:user", ["query"]
  end

  it "invokes search:code" do
    expect(api_class).to receive(:code).with({"q" => "query"}, format)
    subject.invoke "search:code", ["query"]
  end
end
