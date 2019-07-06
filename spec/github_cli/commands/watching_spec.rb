# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Watching do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Watching }

  it "invokes watch:list" do
    expect(api_class).to receive(:list).with(user, repo, {}, format)
    subject.invoke "watch:list", [user, repo]
  end

  it "invokes watch:watched" do
    expect(api_class).to receive(:watched).with({}, format)
    subject.invoke "watch:watched"
  end

  it "invokes watch:watched --user" do
    expect(api_class).to receive(:watched).with({"user" => user}, format)
    subject.invoke "watch:watched", [], {:user => user}
  end

  it "invokes watch:watching" do
    expect(api_class).to receive(:watching?).with(user, repo, {}, format)
    subject.invoke "watch:watching", [user, repo]
  end

  it "invokes watch:start" do
    expect(api_class).to receive(:start).with(user, repo, {}, format)
    subject.invoke "watch:start", [user, repo]
  end

  it "invokes watch:stop" do
    expect(api_class).to receive(:stop).with(user, repo, {}, format)
    subject.invoke "watch:stop", [user, repo]
  end
end
