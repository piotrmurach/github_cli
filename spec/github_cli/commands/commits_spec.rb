# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Commits do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:sha)    { '3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15' }
  let(:api_class) { GithubCLI::Commit }

  it "invokes commit:get" do
    api_class.should_receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "commit:get", [user, repo, sha]
  end

  it "invokes commit:create" do
    api_class.should_receive(:create).with(user, repo, {}, format)
    subject.invoke "commit:create", [user, repo]
  end

  it "invokes commit:create --tree" do
    api_class.should_receive(:create).with(user, repo, {"tree" => sha}, format)
    subject.invoke "commit:create", [user, repo], :tree => sha
  end
end
