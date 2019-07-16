# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Trees do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:sha)    { "3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15" }
  let(:api_class) { GithubCLI::Tree }

  it "invokes tree:get" do
    expect(api_class).to receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "tree:get", [user, repo, sha]
  end

  it "invokes tree:get" do
    expect(api_class).to receive(:get).with(user, repo, sha, {"recursive" => true}, format)
    subject.invoke "tree:get", [user, repo, sha], :recursive => true
  end

  it "invokes tree:create" do
    opts = {
      "base_tree" => "9fb037999f264ba9a7fc6274d15fa3ae2ab98312",
      "tree" => [
          {
            "path" => "file.rb",
            "mode" => "100644",
            "type" => "blob",
            "sha" => "44b4fc6d56897b048c772eb4087f854f46256132"
          }
        ]
    }
    expect(api_class).to receive(:create).with(user, repo, opts, format)
    subject.invoke "tree:create", [user, repo], opts
  end
end
