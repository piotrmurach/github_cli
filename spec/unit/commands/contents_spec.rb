# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Contents do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:path)   { "README.md" }
  let(:api_class) { GithubCLI::Content }

  it "invokes content:readme" do
    expect(api_class).to receive(:readme).with(user, repo, {}, format)
    subject.invoke "content:readme", [user, repo]
  end

  it "invokes content:readme --ref" do
    expect(api_class).to receive(:readme).with(user, repo, {"ref"=>"master"}, format)
    subject.invoke "content:readme", [user, repo], :ref => "master"
  end

  it "invokes content:get" do
    expect(api_class).to receive(:get).with(user, repo, path, {}, format)
    subject.invoke "content:get", [user, repo, path]
  end

  it "invokes content:get --ref" do
    expect(api_class).to receive(:get).with(user, repo, path,{"ref"=>"master"},format)
    subject.invoke "content:get", [user, repo, path], :ref => "master"
  end

  it "invokes content:create" do
    expect(api_class).to receive(:create).with(user, repo, path, {"path" => path, "message" => "commit", "content" => "puts"}, format)
    subject.invoke "content:create", [user, repo, path], {:path => path, :message => "commit", :content => "puts"}
  end

  it "invokes content:delete" do
    expect(api_class).to receive(:delete).with(user, repo, path, {"message" => "delete", "sha" => "123abc"}, format)
    subject.invoke "content:delete", [user, repo, path], :message => "delete", :sha => "123abc"
  end

  it "invokes content:archive" do
    expect(api_class).to receive(:archive).with(user, repo, {}, format)
    subject.invoke "content:archive", [user, repo]
  end

  it "invokes content:archive --ref" do
    expect(api_class).to receive(:archive).with(user, repo, {"ref"=>"master"}, format)
    subject.invoke "content:archive", [user, repo], :ref => "master"
  end
end
