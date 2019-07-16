# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::References do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:ref)    { "refs/master" }
  let(:sha)    { "3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15" }
  let(:api_class) { GithubCLI::Reference }

  it "invokes ref:list" do
    expect(api_class).to receive(:list).with(user, repo, {}, format)
    subject.invoke "ref:list", [user, repo]
  end

  it "invokes ref:list --ref" do
    expect(api_class).to receive(:list).with(user, repo, {"ref" => ref}, format)
    subject.invoke "ref:list", [user, repo], :ref => ref
  end

  it "invokes ref:get" do
    expect(api_class).to receive(:get).with(user, repo, ref, {}, format)
    subject.invoke "ref:get", [user, repo, ref]
  end

  it "invokes ref:create" do
    opts = {
      "ref" => "refs/heads/featureA",
      "sha" => "aa218f56b14c9653891f9e74264a383fa43fefbd"
    }
    expect(api_class).to receive(:create).with(user, repo, opts, format)
    subject.invoke "ref:create", [user, repo], opts
  end

  it "invokes ref:update --sha -f" do
    opts = {
      "sha" => "aa218f56b14c9653891f9e74264a383fa43fefbd",
      "force" => true
    }
    expect(api_class).to receive(:update).with(user, repo, ref, opts, format)
    subject.invoke "ref:update", [user, repo, ref], opts
  end

  it "invokes ref:delete" do
    expect(api_class).to receive(:delete).with(user, repo, ref, {}, format)
    subject.invoke "ref:delete", [user, repo, ref]
  end
end
