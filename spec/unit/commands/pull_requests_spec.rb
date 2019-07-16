# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::PullRequests do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:number) { 1 }
  let(:api_class) { GithubCLI::PullRequest }

  it "invokes pull:list" do
    expect(api_class).to receive(:list).with(user, repo, {}, format)
    subject.invoke "pull:list", [user, repo]
  end

  it "invokes pull:get" do
    expect(api_class).to receive(:get).with(user, repo, number, {}, format)
    subject.invoke "pull:get", [user, repo, number]
  end

  it "invokes pull:create --title" do
    expect(api_class).to receive(:create).with(user, repo, {"title" => 'new'}, format)
    subject.invoke "pull:create", [user, repo], :title => 'new'
  end

  it "invokes pull:update" do
    expect(api_class).to receive(:update).with(user, repo, number, {}, format)
    subject.invoke "pull:update", [user, repo, number]
  end

  it "invokes pull:update --title" do
    expect(api_class).to receive(:update).with(user, repo, number,
      {'title' => 'new'}, format)
    subject.invoke "pull:update", [user, repo, number], :title => 'new'
  end

  it "invokes pull:commits" do
    expect(api_class).to receive(:commits).with(user, repo, number, {}, format)
    subject.invoke "pull:commits", [user, repo, number]
  end

  it "invokes pull:files" do
    expect(api_class).to receive(:files).with(user, repo, number, {}, format)
    subject.invoke "pull:files", [user, repo, number]
  end

  it "invokes pull:merged" do
    expect(api_class).to receive(:merged).with(user, repo, number, {}, format)
    subject.invoke "pull:merged", [user, repo, number]
  end

  it "invokes pull:merge" do
    expect(api_class).to receive(:merge).with(user, repo, number, {}, format)
    subject.invoke "pull:merge", [user, repo, number]
  end
end
