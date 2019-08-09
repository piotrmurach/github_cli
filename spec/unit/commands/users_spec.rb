# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Users do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:name)   { "github_cli" }
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
    expect(api_class).to receive(:get).with({"user" => user}, format)
    subject.invoke "user:get", [], :user => user
  end

  it "invokes user:update --name" do
    opts = {
      "name" => "monalisa octocat",
      "email" => "octocat@github.com",
      "blog" => "https://github.com/blog",
      "company" => "GitHub",
      "location" => "San Francisco",
      "hireable" => true,
      "bio" => "There once..."
    }
    expect(api_class).to receive(:update).with(opts, format)
    subject.invoke "user:update", [], opts
  end
end
