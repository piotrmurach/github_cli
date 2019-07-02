# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Trees do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:sha)    { '3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15' }
  let(:api_class) { GithubCLI::Tree }

  it "invokes tree:get" do
    api_class.should_receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "tree:get", [user, repo, sha]
  end

  it "invokes tree:get" do
    api_class.should_receive(:get).with(user, repo, sha, {'recursive' => true}, format)
    subject.invoke "tree:get", [user, repo, sha], :recursive => true
  end

  it "invokes tree:create" do
    api_class.should_receive(:create).with(user, repo, {}, format)
    subject.invoke "tree:create", [user, repo]
  end

  it "invokes tree:create --tree" do
    tree = { "path" => "file.rb", "mode" => "100644"}
    api_class.should_receive(:create).with(user, repo, {'tree' => [tree]}, format)
    subject.invoke "tree:create", [user, repo], :tree => [tree]
  end
end
