# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Repositories do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:org)    { 'rails' }
  let(:api_class) { GithubCLI::Repository }

  it "invokes repo:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "repo:list", []
  end

  it "invokes repo:list --org" do
    api_class.should_receive(:all).with({"org" => org}, format)
    subject.invoke "repo:list", [], :org => org
  end

  it "invokes repo:list --user" do
    api_class.should_receive(:all).with({"user" => user}, format)
    subject.invoke "repo:list", [], :user => user
  end

  it "invokes repo:list --user --type --sort --direction" do
    api_class.should_receive(:all).with({"user" => user, "type" => "owner",
      "sort" => "created", "direction" => "asc"}, format)
    subject.invoke "repo:list", [], :user => user, :type => "owner",
      :sort => "created", :direction => "asc"
  end

  it "invokes repo:get" do
    api_class.should_receive(:get).with(user, repo, {}, format)
    subject.invoke "repo:get", [user, repo]
  end

  it "invokes repo:create name" do
    api_class.should_receive(:create).with({'name' => repo}, format)
    subject.invoke "repo:create", [repo]
  end

  it "invokes repo:create org/name" do
    api_class.should_receive(:create).with({'name' => repo, 'org' => org}, format)
    subject.invoke "repo:create", ["#{org}/#{repo}"]
  end
end
