# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Users do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:name)   { 'github_cli' }
  let(:api_class) { GithubCLI::User }

  it "invokes user:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "user:list", []
  end

  it "invokes user:get" do
    api_class.should_receive(:get).with({}, format)
    subject.invoke "user:get", []
  end

  it "invokes user:get" do
    api_class.should_receive(:get).with({'user' => user}, format)
    subject.invoke "user:get", [], :user => user
  end

  it "invokes user:update --name" do
    api_class.should_receive(:update).with({'name' => name}, format)
    subject.invoke "user:update", [], :name => name
  end
end
