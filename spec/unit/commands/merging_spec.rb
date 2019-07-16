# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Merging do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:repo)   { 'github_cli' }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Merging }

  it "invokes merge:perform" do
    expect(api_class).to receive(:merge).with(user, repo, {'base'=>'master', 'head'=>'feature'}, format)
    subject.invoke "merge:perform", [user, repo], :base => 'master', :head => 'feature'
  end
end
