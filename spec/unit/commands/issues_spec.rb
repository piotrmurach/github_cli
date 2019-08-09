# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Issues do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:org)    { "github" }
  let(:number) { 1 }
  let(:api_class) { GithubCLI::Issue }

  it "invokes issue:list" do
    expect(api_class).to receive(:all).with(:user, {}, format)
    subject.invoke "issue:list", []
  end

  it "invokes issue:list --all" do
    expect(api_class).to receive(:all).with([], {}, format)
    subject.invoke "issue:list", [], :all => true
  end

  it "invokes issue:list --org" do
    expect(api_class).to receive(:all).with([], {"org" => org}, format)
    subject.invoke "issue:list", [], :org => org
  end

  it "invokes issue:list --user --repo" do
    expect(api_class).to receive(:all).with([], {"user" => user, "repo" => repo}, format)
    subject.invoke "issue:list", [], :user => user, :repo => repo
  end

  it "invokes issue:get" do
    expect(api_class).to receive(:get).with(user, repo, number, {}, format)
    subject.invoke "issue:get", [user, repo, number]
  end

  it "invokes issue:create --title" do
    opts = {
      "title" => "Found a bug",
      "body" => "I'm having a problem with this.",
      "assignees" => [
        "octocat"
      ],
      "milestone" => 1,
      "labels" => ["bug"]
    }
    expect(api_class).to receive(:create).with(user, repo, opts, format)
    subject.invoke "issue:create", [user, repo], opts
  end

  it "invokes issue:edit --title" do
    opts = {
      "title" => "Found a bug",
      "body" => "I'm having a problem with this.",
      "assignees" => [
        "octocat"
      ],
      "state" => "open",
      "milestone" => 1,
      "labels" => ["bug"]
    }
    expect(api_class).to receive(:edit).with(user, repo, number, opts, format)
    subject.invoke "issue:edit", [user, repo, number], opts
  end
end
