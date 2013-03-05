# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Assignees do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Assignee }

  it "invokes assignee:list" do
    api_class.should_receive(:all).with(user, repo, {}, format)
    subject.invoke "assignee:list", [user, repo]
  end

  it "invokes assignee:check" do
    api_class.should_receive(:check).with(user, repo, 'git', {}, format)
    subject.invoke "assignee:check", [user, repo, 'git']
  end
end
