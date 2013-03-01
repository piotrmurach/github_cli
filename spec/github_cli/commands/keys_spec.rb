# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Keys do
  let(:format) { 'table' }
  let(:id)     { 1 }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github' }
  let(:api_class) { GithubCLI::Key }

  it "invokes key:list" do
    api_class.should_receive(:all).with(user, repo, {}, format)
    subject.invoke "key:list", [user, repo]
  end

  it "invokes key:get" do
    api_class.should_receive(:get).with(user, repo, id, {}, format)
    subject.invoke "key:get", [user, repo, id]
  end

  it "invokes key:create" do
    api_class.should_receive(:create).with(user, repo, {}, format)
    subject.invoke "key:create", [user, repo]
  end

  it "invokes key:edit" do
    api_class.should_receive(:edit).with(user, repo, id, {}, format)
    subject.invoke "key:edit", [user, repo, id]
  end

  it "invokes key:delete" do
    api_class.should_receive(:delete).with(user, repo, id, {}, format)
    subject.invoke "key:delete", [user, repo, id]
  end
end
