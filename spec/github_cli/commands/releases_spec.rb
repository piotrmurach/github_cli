# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Releases do
  let(:format) { {"format" => "table"} }
  let(:owner)  { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:api_class) { GithubCLI::Release }

  it "invokes release:list" do
    expect(api_class).to receive(:all).with(owner, repo, {}, format)
    subject.invoke "release:list", [owner, repo]
  end

  it "invokes release:get" do
    expect(api_class).to receive(:get).with(owner, repo, 1, {}, format)
    subject.invoke "release:get", [owner, repo, 1]
  end

  it "invokes release:latest" do
    expect(api_class).to receive(:latest).with(owner, repo, {}, format)
    subject.invoke "release:latest", [owner, repo]
  end

  it "invokes release:create --tag_name" do
    opts = {
      "tag_name" => "v1.0.0",
      "target_commitish" => "master",
      "name" => "v1.0.0",
      "body" => "Description of the release",
      "draft" => false,
      "prerelease" => false
    }
    expect(api_class).to receive(:create).with(owner, repo, opts, format)
    subject.invoke "release:create", [owner, repo], opts
  end

  it "invokes release:edit --tag_name" do
    opts = {
      "tag_name" => "v1.0.0",
      "target_commitish" => "master",
      "name" => "v1.0.0",
      "body" => "Description of the release",
      "draft" => false,
      "prerelease" => false
    }
    expect(api_class).to receive(:edit).with(owner, repo, opts, format)
    subject.invoke "release:edit", [owner, repo], opts
  end

  it "invokes release:delete" do
    expect(api_class).to receive(:delete).with(owner, repo, 1, {}, format)
    subject.invoke "release:delete", [owner, repo, 1]
  end
end
