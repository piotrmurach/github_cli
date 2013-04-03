# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Notifications do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Notification }

  it "invokes notify:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "notify:list", []
  end

  it "invokes notify:list --user --repo" do
    api_class.should_receive(:all).with({'user' => user, 'repo' => repo}, format)
    subject.invoke "notify:list", [], :user => user, :repo => repo
  end

  it "invokes notify:get" do
    api_class.should_receive(:get).with(id, {}, format)
    subject.invoke "notify:get", [id]
  end
end
