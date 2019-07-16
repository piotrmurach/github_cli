# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Starring do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:api_class) { GithubCLI::Starring }

  it "invokes star:list" do
    expect(api_class).to receive(:list).with(user, repo, {}, format)
    subject.invoke "star:list", [user, repo]
  end

  it "invokes star:starred" do
    expect(api_class).to receive(:starred).with({}, format)
    subject.invoke "star:starred", []
  end

  it "invokes star:starred --user" do
    expect(api_class).to receive(:starred).with({"user" => user}, format)
    subject.invoke "star:starred", [], :user => user
  end

  it "invokes star:starring" do
    expect(api_class).to receive(:starring?).with(user, repo, {}, format)
    subject.invoke "star:starring", [user, repo]
  end

  it "invokes star:star" do
    expect(api_class).to receive(:star).with(user, repo, {}, format)
    subject.invoke "star:star", [user, repo]
  end

  it "invokes star:star" do
    expect(api_class).to receive(:unstar).with(user, repo, {}, format)
    subject.invoke "star:unstar", [user, repo]
  end
end
