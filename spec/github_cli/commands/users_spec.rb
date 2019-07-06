# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Users do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:name)   { 'github_cli' }
  let(:api_class) { GithubCLI::User }

  it "invokes user:list" do
    expect(api_class).to receive(:all).with({}, format)
    subject.invoke "user:list", []
  end

  it "invokes user:get" do
    expect(api_class).to receive(:get).with({}, format)
    subject.invoke "user:get", []
  end

  it "invokes user:get" do
    expect(api_class).to receive(:get).with({'user' => user}, format)
    subject.invoke "user:get", [], :user => user
  end

  it "invokes user:update --name" do
    expect(api_class).to receive(:update).with({'name' => name}, format)
    subject.invoke "user:update", [], :name => name
  end
end
