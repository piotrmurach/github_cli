# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Keys do
  let(:format) { {"format" => "table"} }
  let(:id)     { 1 }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github" }
  let(:api_class) { GithubCLI::Key }

  it "invokes key:list" do
    expect(api_class).to receive(:all).with(user, repo, {}, format)
    subject.invoke "key:list", [user, repo]
  end

  it "invokes key:get" do
    expect(api_class).to receive(:get).with(user, repo, id, {}, format)
    subject.invoke "key:get", [user, repo, id]
  end

  it "invokes key:create" do
    expect(api_class).to receive(:create).with(user, repo, {}, format)
    subject.invoke "key:create", [user, repo]
  end

  it "invokes key:edit" do
    expect(api_class).to receive(:edit).with(user, repo, id, {}, format)
    subject.invoke "key:edit", [user, repo, id]
  end

  it "invokes key:delete" do
    expect(api_class).to receive(:delete).with(user, repo, id, {}, format)
    subject.invoke "key:delete", [user, repo, id]
  end
end
