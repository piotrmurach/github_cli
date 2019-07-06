# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Hooks do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
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
    expect(api_class).to receive(:create).with(user, repo, {'name' => 'web',
      "config" => { :url => "http://example.com/webhook" } }, format)
    subject.invoke "hook:create", [user, repo], :name => 'web',
      :config => {:url => "http://example.com/webhook" }
  end

  it "invokes hook:edit --name --config" do
    expect(api_class).to receive(:edit).with(user, repo, id, {'name' => 'web',
      "config" => { :url => "http://example.com/webhook" } }, format)
    subject.invoke "hook:edit", [user, repo, id], :name => 'web',
      :config => {:url => "http://example.com/webhook" }
  end

  it "invokes hook:test" do
    expect(api_class).to receive(:test).with(user, repo, id, {}, format)
    subject.invoke "hook:test", [user, repo, id]
  end

  it "invokes hook:delete" do
    expect(api_class).to receive(:delete).with(user, repo, id, {}, format)
    subject.invoke "hook:delete", [user, repo, id]
  end
end
