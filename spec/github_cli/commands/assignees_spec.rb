# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Assignees do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Assignee }

  it "invokes assignee:list" do
    expect(api_class).to receive(:all).with(user, repo, {}, format)
    subject.invoke "assignee:list", [user, repo]
  end

  it "invokes assignee:check" do
    expect(api_class).to receive(:check).with(user, repo, 'git', {}, format)
    subject.invoke "assignee:check", [user, repo, 'git']
  end
end
