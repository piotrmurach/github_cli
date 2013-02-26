# encoding: utf-8

require 'spec_helper'

describe GithubCLI::Commands::Followers do
  let(:format) { 'table' }
  let(:user)   { 'peter-murach' }
  let(:api_class) { GithubCLI::Follower }

  it "invokes follower:list with user" do
    api_class.should_receive(:all).with(user, {}, format)
    subject.invoke "follower:list", [], :user => user
  end

  it "invokes follower:list without user" do
    api_class.should_receive(:all).with(nil, {}, format)
    subject.invoke "follower:list", []
  end

  it "invokes follower:following with user" do
    api_class.should_receive(:following).with(user, {}, format)
    subject.invoke "follower:following", [], :user => user
  end

  it "invokes follower:following without user" do
    api_class.should_receive(:following).with(nil, {}, format)
    subject.invoke "follower:following", []
  end

  it "invokes follower:follower without user" do
    api_class.should_receive(:follower).with(user, {}, format)
    subject.invoke "follower:follower", [user]
  end

  it "invokes follower:follow with user" do
    api_class.should_receive(:follow).with(user, {}, format)
    subject.invoke "follower:follow", [user]
  end

  it "invokes follower:follow with user" do
    api_class.should_receive(:unfollow).with(user, {}, format)
    subject.invoke "follower:unfollow", [user]
  end
end
