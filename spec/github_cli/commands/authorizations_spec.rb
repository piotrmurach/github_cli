# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Authorizations do
  let(:format) { 'table' }
  let(:id) { 1 }
  let(:api_class) { GithubCLI::Authorization }

  it "invokes auth:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "auth:list", []
  end

  it "invokes auth:get" do
    api_class.should_receive(:get).with(id, {}, format)
    subject.invoke "auth:get", [id]
  end

  it "invokes auth:create --scopes --note --note_url" do
    api_class.should_receive(:create).with({"scopes" => ["repo"],
      "note" => "github_cli",
      "note_url" => "https://github.com/peter-murach/github_cli"}, format)
    subject.invoke "auth:create", [], :scopes => ["repo"], :note => 'github_cli', :note_url => "https://github.com/peter-murach/github_cli"
  end

  it "invokes auth:update" do
    api_class.should_receive(:update).with(id, {}, format)
    subject.invoke "auth:update", [id]
  end

  it "invokes auth:update --scopes --note --note_url" do
    api_class.should_receive(:update).with(id, {"scopes" => ["repo"],
      "note" => "github_cli",
      "note_url" => "https://github.com/peter-murach/github_cli"}, format)
    subject.invoke "auth:update", [id], :scopes => ["repo"], :note => 'github_cli', :note_url => "https://github.com/peter-murach/github_cli"
  end

  it "invokes auth:delete" do
    api_class.should_receive(:delete).with(id, {}, format)
    subject.invoke "auth:delete", [id]
  end
end
