# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Issues do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:org)    { 'github' }
  let(:number) { 1 }
  let(:api_class) { GithubCLI::Issue }

  it "invokes issue:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "issue:list", []
  end

  it "invokes issue:list --all" do
    api_class.should_receive(:all).with({"user" => user, "repo" => repo}, format)
    subject.invoke "issue:list", [], :user => user, :repo => repo
  end

  it "invokes issue:list --org" do
    api_class.should_receive(:all).with({"org" => org}, format)
    subject.invoke "issue:list", [], :org => org
  end

  it "invokes issue:list --user --repo" do
    api_class.should_receive(:all).with({"user" => user, "repo" => repo}, format)
    subject.invoke "issue:list", [], :user => user, :repo => repo
  end

  it "invokes issue:get" do
    api_class.should_receive(:get).with(user, repo, number, {}, format)
    subject.invoke "issue:get", [user, repo, number]
  end

  it "invokes issue:create --title" do
    api_class.should_receive(:create).with(user, repo, {"title" => 'new'}, format)
    subject.invoke "issue:create", [user, repo], :title => 'new'
  end

  it "invokes issue:create --title --milestone" do
    api_class.should_receive(:create).with(user, repo, {"title" => 'new', 
      'milestone' => 1}, format)
    subject.invoke "issue:create", [user, repo], :title => 'new', :milestone => 1
  end

  it "invokes issue:edit --title" do
    api_class.should_receive(:edit).with(user, repo, number,
      {"title" => 'new'}, format)
    subject.invoke "issue:edit", [user, repo, number], :title => 'new'
  end

  it "invokes issue:edit --title --milestone" do
    api_class.should_receive(:edit).with(user, repo, number, {"title" => 'new',
      'milestone' => number}, format)
    subject.invoke "issue:edit", [user, repo, number], :title => 'new',
       :milestone => number
  end

end
