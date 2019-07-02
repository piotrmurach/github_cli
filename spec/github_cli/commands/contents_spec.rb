# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Contents do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:path)   { 'README.md' }
  let(:api_class) { GithubCLI::Content }

  it "invokes content:readme" do
    api_class.should_receive(:readme).with(user, repo, {}, format)
    subject.invoke "content:readme", [user, repo]
  end

  it "invokes content:readme --ref" do
    api_class.should_receive(:readme).with(user, repo, {'ref'=>'master'}, format)
    subject.invoke "content:readme", [user, repo], :ref => "master"
  end

  it "invokes content:get" do
    api_class.should_receive(:get).with(user, repo, path, {}, format)
    subject.invoke "content:get", [user, repo, path]
  end

  it "invokes content:get --ref" do
    api_class.should_receive(:get).with(user, repo, path,{'ref'=>'master'},format)
    subject.invoke "content:get", [user, repo, path], :ref => "master"
  end

  it "invokes content:create" do
    api_class.should_receive(:create).with(user, repo, path, {'path' => path, 'message' => 'commit', 'content' => 'puts'}, format)
    subject.invoke "content:create", [user, repo, path], {:path => path, :message => 'commit', :content => 'puts'}
  end

  it "invokes content:archive" do
    api_class.should_receive(:archive).with(user, repo, {}, format)
    subject.invoke "content:archive", [user, repo]
  end

  it "invokes content:archive --ref" do
    api_class.should_receive(:archive).with(user, repo, {'ref'=>'master'}, format)
    subject.invoke "content:archive", [user, repo], :ref => 'master'
  end
end
