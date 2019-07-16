# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Tags do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:sha)    { "3a0f86fb8db8eea7ccbb9a95f325ddbedfb25e15" }
  let(:api_class) { GithubCLI::Tag }

  it "invokes tag:get" do
    expect(api_class).to receive(:get).with(user, repo, sha, {}, format)
    subject.invoke "tag:get", [user, repo, sha]
  end

  it "invokes tag:create" do
    opts = {
      "tag" => "v0.0.1",
      "message" => "initial version\n",
      "object" => "c3d0be41ecbe669545ee3e94d31ed9a4bc91ee3c",
      "type" => "commit",
      "tagger" => {
          "name" => "Monalisa Octocat",
          "email" => "octocat@github.com",
          "date" => "2011-06-17T14:53:35-07:00"
      }
    }
    expect(api_class).to receive(:create).with(user, repo, opts, format)
    subject.invoke "tag:create", [user, repo], opts
  end
end
