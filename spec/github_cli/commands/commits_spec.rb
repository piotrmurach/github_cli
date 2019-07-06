# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Commits do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:sha)    { '3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15' }
  let(:api_class) { GithubCLI::Commit }

  it "invokes commit:get" do
    expect(api_class).to receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "commit:get", [user, repo, sha]
  end

  it "invokes commit:create" do
    expect(api_class).to receive(:create).with(user, repo, {}, format)
    subject.invoke "commit:create", [user, repo]
  end

  it "invokes commit:create --tree" do
    expect(api_class).to receive(:create).with(user, repo, {"tree" => sha}, format)
    subject.invoke "commit:create", [user, repo], :tree => sha
  end
end
