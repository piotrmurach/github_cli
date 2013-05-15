# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Members do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:org)    { 'github' }
  let(:api_class) { GithubCLI::Member }

  it "invokes member:list" do
    api_class.should_receive(:all).with(org, {}, format)
    subject.invoke "member:list", [org]
  end

  it "invokes member:list --public" do
    api_class.should_receive(:all).with(org, {'public' => true}, format)
    subject.invoke "member:list", [org], {:public => true}
  end

  it "invokes member:member" do
    api_class.should_receive(:member?).with(org, user, {}, format)
    subject.invoke "member:member", [org, user]
  end

  it "invokes member:member --public" do
    api_class.should_receive(:member?).with(org, user, {}, format)
    subject.invoke "member:member", [org, user]
  end

  it "invokes member:delete" do
    api_class.should_receive(:delete).with(org, user, {}, format)
    subject.invoke "member:delete", [org, user]
  end

  it "invokes member:publicize" do
    api_class.should_receive(:publicize).with(org, user, {}, format)
    subject.invoke "member:publicize", [org, user]
  end

  it "invokes member:conceal" do
    api_class.should_receive(:conceal).with(org, user, {}, format)
    subject.invoke "member:conceal", [org, user]
  end
end
