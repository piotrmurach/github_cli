# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Notifications do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Notification }

  it "invokes notify:list" do
    expect(api_class).to receive(:all).with({}, format)
    subject.invoke "notify:list", []
  end

  it "invokes notify:list --user --repo" do
    expect(api_class).to receive(:all).with({"user" => user, "repo" => repo}, format)
    subject.invoke "notify:list", [], :user => user, :repo => repo
  end

  it "invokes notify:get" do
    expect(api_class).to receive(:get).with(id, {}, format)
    subject.invoke "notify:get", [id]
  end

  it "invokes notify:mark" do
    expect(api_class).to receive(:mark).with({"read"=>true}, format)
    subject.invoke "notify:mark", [], :read => true
  end

  it "invokes notify:mark --id" do
    expect(api_class).to receive(:mark).with({"thread_id"=>id,"read"=>true}, format)
    subject.invoke "notify:mark", [], :id => id, :read => true
  end

  it "invokes notify:mark --user --repo" do
    expect(api_class).to receive(:mark).with({"user"=>user,"repo"=>repo}, format)
    subject.invoke "notify:mark", [], :user => user, :repo => repo
  end

  it "invokes notify:check" do
    expect(api_class).to receive(:subscribed?).with(id, {}, format)
    subject.invoke "notify:check", [id]
  end

  it "invokes notify:create" do
    expect(api_class).to receive(:create).with(id, {}, format)
    subject.invoke "notify:create", [id]
  end

  it "invokes notify:delete" do
    expect(api_class).to receive(:delete).with(id, {}, format)
    subject.invoke "notify:delete", [id]
  end

end
