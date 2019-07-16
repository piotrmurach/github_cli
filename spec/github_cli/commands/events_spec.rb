# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Events do
  let(:format) { { "format" => "table" } }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:org)    { "github" }
  let(:api_class) { GithubCLI::Event }

  it "invokes event:public" do
    expect(api_class).to receive(:public).with({}, format)
    subject.invoke "event:public", []
  end

  it "invokes event:repo" do
    expect(api_class).to receive(:repository).with(user, repo, {}, format)
    subject.invoke "event:repo", [user, repo]
  end

  it "invokes event:issue" do
    expect(api_class).to receive(:repository).with(user, repo, {}, format)
    subject.invoke "event:repo", [user, repo]
  end

  it "invokes event:network" do
    expect(api_class).to receive(:network).with(user, repo, {}, format)
    subject.invoke "event:network", [user, repo]
  end

  it "invokes event:org" do
    expect(api_class).to receive(:organization).with(org, {}, format)
    subject.invoke "event:org", [org]
  end

  it "invokes event:received" do
    expect(api_class).to receive(:received).with(user, {}, format)
    subject.invoke "event:received", [user]
  end

  it "invokes event:received --public" do
    expect(api_class).to receive(:received).with(user, {"public" => true}, format)
    subject.invoke "event:received", [user], :public => true
  end

  it "invokes event:performed" do
    expect(api_class).to receive(:performed).with(user, {}, format)
    subject.invoke "event:performed", [user]
  end

  it "invokes event:user_org" do
    expect(api_class).to receive(:user_org).with(user, org, {}, format)
    subject.invoke "event:user_org", [user, org]
  end
end
