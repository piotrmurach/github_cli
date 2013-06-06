# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Statistics do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Statistics }

  it "invokes stat:contribs" do
    api_class.should_receive(:contributors).with(user, repo, {}, format)
    subject.invoke "stat:contribs", [user, repo]
  end

  it "invokes stat:activity" do
    api_class.should_receive(:activity).with(user, repo, {}, format)
    subject.invoke "stat:activity", [user, repo]
  end

  it "invokes stat:frequency" do
    api_class.should_receive(:frequency).with(user, repo, {}, format)
    subject.invoke "stat:frequency", [user, repo]
  end

  it "invokes stat:participation" do
    api_class.should_receive(:participation).with(user, repo, {}, format)
    subject.invoke "stat:participation", [user, repo]
  end

  it "invokes stat:card" do
    api_class.should_receive(:card).with(user, repo, {}, format)
    subject.invoke "stat:card", [user, repo]
  end
end
