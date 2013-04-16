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
    api_class.should_receive(:create).with({
      'name' => repo, 'private' => nil, 'has_issues' => nil,
      'has_wiki' => nil, 'has_downloads' => nil, 'auto_init' => nil}, format)
    subject.invoke "repo:create", [repo]
  end

  it "invokes repo:create org/name" do
    api_class.should_receive(:create).with({
      'name' => repo, 'org' => org, 'private' => nil, 'has_issues' => nil,
      'has_wiki' => nil, 'has_downloads' => nil, 'auto_init' => nil}, format)
    subject.invoke "repo:create", ["#{org}/#{repo}"]
  end

  it "invokes repo:create name --org" do
    api_class.should_receive(:create).with({
      'name' => repo, 'org' => org, 'private' => nil, 'has_issues' => nil,
      'has_wiki' => nil, 'has_downloads' => nil, 'auto_init' => nil}, format)
    subject.invoke "repo:create", [repo], :org => org
  end

  it "invokes repo:create name --wiki --issues --downloads --auto_init" do
    api_class.should_receive(:create).with({
     'name' => repo, "has_wiki" => true, 'private' => nil,
      "has_issues" => true, "has_downloads" => true, "auto_init" => true}, format)
    subject.invoke "repo:create", [repo], :wiki => true, :issues => true,
      :downloads => true, :auto => true
  end

  it "invokes repo:edit user repo name" do
    api_class.should_receive(:edit).with(user, repo, {
      'name' => 'new', 'private' => nil,
      "has_wiki" => nil, "has_issues" => nil, "has_downloads" => nil}, format)
    subject.invoke "repo:edit", [user, repo, 'new']
  end

  it "invokes repo:edit user repo name --wiki --issues --downloads --auto_init" do
    api_class.should_receive(:edit).with(user, repo, {
      'name' => 'new', 'private' => nil,
      "has_wiki" => true, "has_issues" => true, "has_downloads" => true}, format)
    subject.invoke "repo:edit", [user, repo, 'new'], :wiki => true,
      :issues => true, :downloads => true
  end

  it "invokes repo:delete user repo" do
    api_class.should_receive(:delete).with(user, repo, {}, format)
    subject.invoke "repo:delete", [user, repo]
  end

  it "invokes repo:branches" do
    api_class.should_receive(:branches).with(user, repo, {}, format)
    subject.invoke "repo:branches", [user, repo]
  end

  it "invokes repo:branch" do
    api_class.should_receive(:branch).with(user, repo, 'new', {}, format)
    subject.invoke "repo:branch", [user, repo, 'new']
  end

  it "invokes repo:contribs" do
    api_class.should_receive(:contributors).with(user, repo, {}, format)
    subject.invoke "repo:contribs", [user, repo]
  end

  it "invokes repo:langs" do
    api_class.should_receive(:languages).with(user, repo, {}, format)
    subject.invoke "repo:langs", [user, repo]
  end

  it "invokes repo:tags" do
    api_class.should_receive(:tags).with(user, repo, {}, format)
    subject.invoke "repo:tags", [user, repo]
  end

  it "invokes repo:teams" do
    api_class.should_receive(:teams).with(user, repo, {}, format)
    subject.invoke "repo:teams", [user, repo]
  end
end
