# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Organizations do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:org)    { "github" }
  let(:api_class) { GithubCLI::Organization }

  it "invokes org:list" do
    expect(api_class).to receive(:list).with({}, format)
    subject.invoke "org:list", []
  end

  it "invokes org:list --user" do
    expect(api_class).to receive(:list).with({"user" => user}, format)
    subject.invoke "org:list", [], {:user => user}
  end

  it "invokes org:get" do
    expect(api_class).to receive(:get).with(org, {}, format)
    subject.invoke "org:get", [org]
  end

  it "invokes org:edit" do
    opts = {
      "billing_email" => "support@github.com",
      "blog" => "https://github.com/blog",
      "company" => "GitHub",
      "email" => "support@github.com",
      "location" => "San Francisco",
      "name" => "github",
      "description" => "GitHub, the company.",
      "default_repository_permission" => "read",
      "members_can_create_repositories" => true,
      "members_allowed_repository_creation_type" => "all"
    }
    expect(api_class).to receive(:edit).with(org, opts, format)
    subject.invoke "org:edit", [org], opts
  end
end
