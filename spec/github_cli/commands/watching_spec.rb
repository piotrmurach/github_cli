# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Watching do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Watching }

  it "invokes watch:list" do
    api_class.should_receive(:list).with(user, repo, {}, format)
    subject.invoke "watch:list", [user, repo]
  end

  it "invokes watch:watched" do
    api_class.should_receive(:watched).with({}, format)
    subject.invoke "watch:watched"
  end

  it "invokes watch:watched --user" do
    api_class.should_receive(:watched).with({"user" => user}, format)
    subject.invoke "watch:watched", [], {:user => user}
  end

  it "invokes watch:watching" do
    api_class.should_receive(:watching?).with(user, repo, {}, format)
    subject.invoke "watch:watching", [user, repo]
  end

  it "invokes watch:start" do
    api_class.should_receive(:start).with(user, repo, {}, format)
    subject.invoke "watch:start", [user, repo]
  end

  it "invokes watch:stop" do
    api_class.should_receive(:stop).with(user, repo, {}, format)
    subject.invoke "watch:stop", [user, repo]
  end
end
