# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Events do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:org)    { 'github' }
  let(:api_class) { GithubCLI::Event }

  it "invokes event:public" do
    api_class.should_receive(:public).with({}, format)
    subject.invoke "event:public"
  end

  it "invokes event:public" do
    api_class.should_receive(:repository).with(user, repo, {}, format)
    subject.invoke "event:repo", [user, repo]
  end

  it "invokes event:public" do
    api_class.should_receive(:issue).with(user, repo, {}, format)
    subject.invoke "event:issue", [user, repo]
  end

  it "invokes event:public" do
    api_class.should_receive(:network).with(user, repo, {}, format)
    subject.invoke "event:network", [user, repo]
  end

  it "invokes event:org" do
    api_class.should_receive(:organization).with(org, {}, format)
    subject.invoke "event:org", [org]
  end

  it "invokes event:received" do
    api_class.should_receive(:received).with(user, {}, format)
    subject.invoke "event:received", [user]
  end

  it "invokes event:received --public" do
    api_class.should_receive(:received).with(user, {"public" => true}, format)
    subject.invoke "event:received", [user], :public => true
  end

  it "invokes event:performed" do
    api_class.should_receive(:performed).with(user, {}, format)
    subject.invoke "event:performed", [user]
  end

  it "invokes event:performed --public" do
    api_class.should_receive(:performed).with(user, {"public" => true}, format)
    subject.invoke "event:performed", [user], :public => true
  end

  it "invokes event:user_org" do
    api_class.should_receive(:user_org).with(user, org, {}, format)
    subject.invoke "event:user_org", [user, org]
  end
end
