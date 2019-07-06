# encoding: utf-8

RSpec.describe GithubCLI::Commands::Followers do
  let(:format) { { 'format' => 'table' } }
  let(:user)   { 'peter-murach' }
  let(:api_class) { GithubCLI::Follower }

  it "invokes follower:list with user" do
    expect(api_class).to receive(:all).with(user, {}, format)
    subject.invoke "follower:list", [], :user => user
  end

  it "invokes follower:list without user" do
    expect(api_class).to receive(:all).with(nil, {}, format)
    subject.invoke "follower:list", []
  end

  it "invokes follower:following with user" do
    expect(api_class).to receive(:following).with(user, {}, format)
    subject.invoke "follower:following", [], :user => user
  end

  it "invokes follower:following without user" do
    expect(api_class).to receive(:following).with(nil, {}, format)
    subject.invoke "follower:following", []
  end

  it "invokes follower:follower without user" do
    expect(api_class).to receive(:follower).with(user, {}, format)
    subject.invoke "follower:follower", [user]
  end

  it "invokes follower:follow with user" do
    expect(api_class).to receive(:follow).with(user, {}, format)
    subject.invoke "follower:follow", [user]
  end

  it "invokes follower:follow with user" do
    expect(api_class).to receive(:unfollow).with(user, {}, format)
    subject.invoke "follower:unfollow", [user]
  end
end
