# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Teams do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:org)    { 'rails' }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Team }

  it "invokes team:list" do
    api_class.should_receive(:all).with(org, {}, format)
    subject.invoke "team:list", [org]
  end

  it "invokes team:get" do
    api_class.should_receive(:get).with(id, {}, format)
    subject.invoke "team:get", [id]
  end

  it "invokes team:create --name" do
    api_class.should_receive(:create).with(org, {"name" => 'new'}, format)
    subject.invoke "team:create", [org], :name => 'new'
  end

  it "invokes team:edit --name" do
    api_class.should_receive(:edit).with(id, {"name" => 'new'}, format)
    subject.invoke "team:edit", [id], :name => 'new'
  end

  it "invokes team:delete" do
    api_class.should_receive(:delete).with(id, {}, format)
    subject.invoke "team:delete", [id]
  end

  it "invokes team:list_member" do
    api_class.should_receive(:all_member).with(id, {}, format)
    subject.invoke "team:list_member", [id]
  end

  it "invokes team:member" do
    api_class.should_receive(:member).with(id, user, {}, format)
    subject.invoke "team:member", [id, user]
  end

  it "invokes team:add_member" do
    api_class.should_receive(:add_member).with(id, user, {}, format)
    subject.invoke "team:add_member", [id, user]
  end

  it "invokes team:remove_member" do
    api_class.should_receive(:remove_member).with(id, user, {}, format)
    subject.invoke "team:remove_member", [id, user]
  end

  it "invokes team:list_repo" do
    api_class.should_receive(:all_repo).with(id, {}, format)
    subject.invoke "team:list_repo", [id]
  end

  it "invokes team:repo" do
    api_class.should_receive(:repo).with(id, user, repo, {}, format)
    subject.invoke "team:repo", [id, user, repo]
  end

  it "invokes team:add_repo" do
    api_class.should_receive(:add_repo).with(id, user, repo, {}, format)
    subject.invoke "team:add_repo", [id, user, repo]
  end

  it "invokes team:remove_repo" do
    api_class.should_receive(:remove_repo).with(id, user, repo, {}, format)
    subject.invoke "team:remove_repo", [id, user, repo]
  end
end
