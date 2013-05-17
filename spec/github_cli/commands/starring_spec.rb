# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Starring do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Starring }

  it "invokes star:list" do
    api_class.should_receive(:list).with(user, repo, {}, format)
    subject.invoke "star:list", [user, repo]
  end

  it "invokes star:starred" do
    api_class.should_receive(:starred).with({}, format)
    subject.invoke "star:starred", []
  end

  it "invokes star:starred --user" do
    api_class.should_receive(:starred).with({"user" => user}, format)
    subject.invoke "star:starred", [], :user => user
  end

  it "invokes star:starring" do
    api_class.should_receive(:starring?).with(user, repo, {}, format)
    subject.invoke "star:starring", [user, repo]
  end

  it "invokes star:star" do
    api_class.should_receive(:star).with(user, repo, {}, format)
    subject.invoke "star:star", [user, repo]
  end

  it "invokes star:star" do
    api_class.should_receive(:unstar).with(user, repo, {}, format)
    subject.invoke "star:unstar", [user, repo]
  end
end
