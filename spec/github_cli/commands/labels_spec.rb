# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Labels do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:name)   { 'bug' }
  let(:api_class) { GithubCLI::Label }

  it "invokes label:list" do
    api_class.should_receive(:all).with(user, repo, {}, format)
    subject.invoke "label:list", [user, repo]
  end

  it "invokes label:get" do
    api_class.should_receive(:get).with(user, repo, name, {}, format)
    subject.invoke "label:get", [user, repo, name]
  end

  it "invokes label:create" do
    api_class.should_receive(:create).with(user, repo, {}, format)
    subject.invoke "label:create", [user, repo]
  end

  it "invokes label:update" do
    api_class.should_receive(:update).with(user, repo, name, {}, format)
    subject.invoke "label:update", [user, repo, name]
  end

  it "invokes label:delete" do
    api_class.should_receive(:delete).with(user, repo, name, {}, format)
    subject.invoke "label:delete", [user, repo, name]
  end

  it "invokes label:issue" do
    api_class.should_receive(:issue).with(user, repo, name, {}, format)
    subject.invoke "label:issue", [user, repo, name]
  end

  it "invokes lable:milestone" do
    api_class.should_receive(:milestone).with(user, repo, 1, {}, format)
    subject.invoke "label:milestone", [user, repo, 1]
  end

  it "invokes lable:add" do
    api_class.should_receive(:add).with(user, repo, 1, [], {}, format)
    subject.invoke "label:add", [user, repo, 1]
  end

  it "invokes lable:remove" do
    api_class.should_receive(:remove).with(user, repo, '1', nil, {}, format)
    subject.invoke "label:remove", [user, repo, '1']
  end

  it "invokes lable:replace" do
    api_class.should_receive(:replace).with(user, repo, 1, [], {}, format)
    subject.invoke "label:replace", [user, repo, 1]
  end
end
