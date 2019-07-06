# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Downloads do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Download }

  it "invokes download:list" do
    expect(api_class).to receive(:all).with(user, repo, {}, format)
    subject.invoke "download:list", [user, repo]
  end

  it "invokes download:get" do
    expect(api_class).to receive(:get).with(user, repo, 1, {}, format)
    subject.invoke "download:get", [user, repo, 1]
  end

  it "invokes download:create --name --size" do
    expect(api_class).to receive(:create).with(user, repo, {"name" => 'file.png', "size" => 12345}, format)
    subject.invoke "download:create", [user, repo], :name => 'file.png', :size => 12345
  end

  it "invokes download:upload" do
    expect(api_class).to receive(:upload).with(user, repo, format)
    subject.invoke "download:upload", [user, repo]
  end

  it "invokes download:delete" do
    expect(api_class).to receive(:delete).with(user, repo, 1, {}, format)
    subject.invoke "download:delete", [user, repo, 1]
  end
end
