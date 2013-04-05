# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Forks do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Fork }

  it "invokes fork:list" do
    api_class.should_receive(:all).with(user, repo, {}, format)
    subject.invoke "fork:list", [user, repo]
  end

  it "invokes fork:list --sort" do
    api_class.should_receive(:all).with(user, repo, {'sort' => 'newest'}, format)
    subject.invoke "fork:list", [user, repo], :sort => 'newest'
  end

  it "invokes fork:create" do
    api_class.should_receive(:create).with(user, repo, {}, format)
    subject.invoke "fork:create", [user, repo]
  end

  it "invokes fork:create --org" do
    api_class.should_receive(:create).with(user, repo, {'organization' => 'rails'}, format)
    subject.invoke "fork:create", [user, repo], :org => 'rails'
  end
end
