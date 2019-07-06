# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Statistics do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:api_class) { GithubCLI::Statistics }

  it "invokes stat:contribs" do
    expect(api_class).to receive(:contributors).with(user, repo, {}, format)
    subject.invoke "stat:contribs", [user, repo]
  end

  it "invokes stat:activity" do
    expect(api_class).to receive(:activity).with(user, repo, {}, format)
    subject.invoke "stat:activity", [user, repo]
  end

  it "invokes stat:frequency" do
    expect(api_class).to receive(:frequency).with(user, repo, {}, format)
    subject.invoke "stat:frequency", [user, repo]
  end

  it "invokes stat:participation" do
    expect(api_class).to receive(:participation).with(user, repo, {}, format)
    subject.invoke "stat:participation", [user, repo]
  end

  it "invokes stat:card" do
    expect(api_class).to receive(:card).with(user, repo, {}, format)
    subject.invoke "stat:card", [user, repo]
  end
end
