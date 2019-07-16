# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Forks do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Fork }

  it "invokes fork:list" do
    expect(api_class).to receive(:all).with(user, repo, {}, format)
    subject.invoke "fork:list", [user, repo]
  end

  it "invokes fork:list --sort" do
    expect(api_class).to receive(:all).with(user, repo, {'sort' => 'newest'}, format)
    subject.invoke "fork:list", [user, repo], :sort => 'newest'
  end

  it "invokes fork:create" do
    expect(api_class).to receive(:create).with(user, repo, {}, format)
    subject.invoke "fork:create", [user, repo]
  end

  it "invokes fork:create --org" do
    expect(api_class).to receive(:create).with(user, repo, {'organization' => 'rails'}, format)
    subject.invoke "fork:create", [user, repo], :org => 'rails'
  end
end
