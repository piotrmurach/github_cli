# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Tags do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:sha)    { '3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15' }
  let(:api_class) { GithubCLI::Tag }

  it "invokes tag:get" do
    api_class.should_receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "tag:get", [user, repo, sha]
  end

  it "invokes tag:create" do
    api_class.should_receive(:create).with(user, repo, {}, format)
    subject.invoke "tag:create", [user, repo]
  end

  it "invokes tag:create --object" do
    api_class.should_receive(:create).with(user, repo, {'object' => sha}, format)
    subject.invoke "tag:create", [user, repo], :object => sha
  end
end
