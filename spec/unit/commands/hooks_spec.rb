# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Hooks do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Hook }

  it "invokes hook:list" do
    expect(api_class).to receive(:all).with(user, repo, {}, format)
    subject.invoke "hook:list", [user, repo]
  end

  it "invokes hook:get" do
    expect(api_class).to receive(:get).with(user, repo, id, {}, format)
    subject.invoke "hook:get", [user, repo, id]
  end

  it "invokes hook:create --name --config" do
    opts = {
      "name" => "web",
      "active" => true,
      "events" => [
          "push",
          "pull_request"
      ],
      "config" => {
        "url" => "https://example.com/webhook",
        "content_type" => "json",
        "insecure_ssl" => "0"
      }
    }
    expect(api_class).to receive(:create).with(user, repo, opts, format)
    subject.invoke "hook:create", [user, repo], opts
  end

  it "invokes hook:edit --name --config" do
    opts = {
      "active" => true,
      "config" => {
        "url" => "http://example.com/webhook"
      }
    }
    expect(api_class).to receive(:edit).with(user, repo, id, opts, format)
    subject.invoke "hook:edit", [user, repo, id], opts
  end

  it "invokes hook:test" do
    expect(api_class).to receive(:test).with(user, repo, id, {}, format)
    subject.invoke "hook:test", [user, repo, id]
  end

  it "invokes hook:ping" do
    expect(api_class).to receive(:ping).with(user, repo, id, {}, format)
    subject.invoke "hook:ping", [user, repo, id]
  end

  it "invokes hook:delete" do
    expect(api_class).to receive(:delete).with(user, repo, id, {}, format)
    subject.invoke "hook:delete", [user, repo, id]
  end
end
