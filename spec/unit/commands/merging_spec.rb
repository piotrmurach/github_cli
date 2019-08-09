# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Merging do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Merging }

  it "invokes merge:perform" do
    opts = {
      "base" => "master",
      "head" => "cool_feature",
      "message" => "Shipped cool_feature!"
    }
    copy_opts = opts.dup
    copy_opts["commit_message"] = copy_opts.delete("message")
    expect(api_class).to receive(:merge).with(user, repo, copy_opts, format)
    subject.invoke "merge:perform", [user, repo], opts
  end
end
