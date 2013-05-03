# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Gists do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:id)    { 1 }
  let(:api_class) { GithubCLI::Gist }

  it "invokes gist:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "gist:list", []
  end

  it "invokes gist:list --user" do
    api_class.should_receive(:all).with({"user" => user}, format)
    subject.invoke "gist:list", [], :user => user
  end

  it "invokes gist:list --starred" do
    api_class.should_receive(:starred).with({}, format)
    subject.invoke "gist:list", [], :starred => true
  end

  it "invokes gist:get" do
    api_class.should_receive(:get).with(id, {}, format)
    subject.invoke "gist:get", [id]
  end

  it "invokes gist:create" do
    api_class.should_receive(:create).with({'public' => false}, format)
    subject.invoke "gist:create", []
  end

  it "invokes gist:create --public --desc" do
    api_class.should_receive(:create).with({'public' => true,
      'description' => 'new'}, format)
    subject.invoke "gist:create", [], :desc => 'new', :public => true
  end

  it "invokes gist:edit id" do
    api_class.should_receive(:edit).with(id, {}, format)
    subject.invoke "gist:edit", [id]
  end

  it "invokes gist:edit id --desc" do
    api_class.should_receive(:edit).with(id, {'description' => 'new'}, format)
    subject.invoke "gist:edit", [id], :desc => 'new'
  end

  it "invokes gist:star id" do
    api_class.should_receive(:star).with(id, {}, format)
    subject.invoke "gist:star", [id]
  end

  it "invokes gist:unstar id" do
    api_class.should_receive(:unstar).with(id, {}, format)
    subject.invoke "gist:unstar", [id]
  end

  it "invokes gist:starred id" do
    api_class.should_receive(:starred?).with(id, {}, format)
    subject.invoke "gist:starred", [id]
  end

  it "invokes gist:fork id" do
    api_class.should_receive(:fork).with(id, {}, format)
    subject.invoke "gist:fork", [id]
  end

  it "invokes gist:delete id" do
    api_class.should_receive(:delete).with(id, {}, format)
    subject.invoke "gist:delete", [id]
  end
end
