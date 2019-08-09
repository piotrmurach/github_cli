# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Statuses do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:sha)    { "7f86c1b73255d4409348d68eb75f7cbbc2aa5c74" }
  let(:api_class) { GithubCLI::Status }

  it "invokes status:list" do
    expect(api_class).to receive(:all).with(user, repo, sha, {}, format)
    subject.invoke "status:list", [user, repo, sha]
  end

  it "invokes status:create" do
    expect(api_class).to receive(:create).with(user, repo, sha, {}, format)
    subject.invoke "status:create", [user, repo, sha]
  end

  it "invokes status:create --state --target" do
    opts = {
      "state" => "success",
      "target_url" => "https://example.com/build/status",
      "description" => "The build succeeded!",
      "context" => "continuous-integration/jenkins"
    }
    copy_opts = opts.dup
    copy_opts["target"] = copy_opts.delete("target_url")
    copy_opts["desc"] = copy_opts.delete("description")
    expect(api_class).to receive(:create).with(user, repo, sha, opts, format)
    subject.invoke "status:create", [user, repo, sha], copy_opts
  end
end
