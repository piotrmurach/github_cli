# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::PullRequests do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:number) { 1 }
  let(:api_class) { GithubCLI::PullRequest }

  it "invokes pull:list" do
    api_class.should_receive(:list).with(user, repo, {}, format)
    subject.invoke "pull:list", [user, repo]
  end

  it "invokes pull:get" do
    api_class.should_receive(:get).with(user, repo, number, {}, format)
    subject.invoke "pull:get", [user, repo, number]
  end

  it "invokes pull:create --title" do
    api_class.should_receive(:create).with(user, repo, {"title" => 'new'}, format)
    subject.invoke "pull:create", [user, repo], :title => 'new'
  end

  it "invokes pull:update" do
    api_class.should_receive(:update).with(user, repo, number, {}, format)
    subject.invoke "pull:update", [user, repo, number]
  end

  it "invokes pull:update --title" do
    api_class.should_receive(:update).with(user, repo, number,
      {'title' => 'new'}, format)
    subject.invoke "pull:update", [user, repo, number], :title => 'new'
  end

  it "invokes pull:commits" do
    api_class.should_receive(:commits).with(user, repo, number, {}, format)
    subject.invoke "pull:commits", [user, repo, number]
  end

  it "invokes pull:files" do
    api_class.should_receive(:files).with(user, repo, number, {}, format)
    subject.invoke "pull:files", [user, repo, number]
  end

  it "invokes pull:merged" do
    api_class.should_receive(:merged).with(user, repo, number, {}, format)
    subject.invoke "pull:merged", [user, repo, number]
  end

  it "invokes pull:merge" do
    api_class.should_receive(:merge).with(user, repo, number, {}, format)
    subject.invoke "pull:merge", [user, repo, number]
  end
end
