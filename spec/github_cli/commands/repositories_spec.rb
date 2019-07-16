# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Repositories do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:org)    { "rails" }
  let(:api_class) { GithubCLI::Repository }

  it "invokes repo:list" do
    expect(api_class).to receive(:all).with({}, format)
    subject.invoke "repo:list", []
  end

  it "invokes repo:list --every" do
    expect(api_class).to receive(:all).with({}, format.merge("every" => true))
    subject.invoke "repo:list", [], {:every => true}
  end

  it "invokes repo:list --org" do
    expect(api_class).to receive(:all).with({"org" => org}, format)
    subject.invoke "repo:list", [], :org => org
  end

  it "invokes repo:list --user" do
    expect(api_class).to receive(:all).with({"user" => user}, format)
    subject.invoke "repo:list", [], :user => user
  end

  it "invokes repo:list --user --type --sort --direction" do
    expect(api_class).to receive(:all).with({"user" => user, "type" => "owner",
      "sort" => "created", "direction" => "asc"}, format)
    subject.invoke "repo:list", [], :user => user, :type => "owner",
      :sort => "created", :direction => "asc"
  end

  it "invokes repo:get" do
    expect(api_class).to receive(:get).with(user, repo, {}, format)
    subject.invoke "repo:get", [user, repo]
  end

  it "invokes repo:create name" do
    opts = {
      "name" => "github_cli",
      "desc" => "This is your first repository",
      "homepage" => "https://github.com",
      "private" => false,
      "issues" => true,
      "projects" => true,
      "wiki" => true
    }
    copy_opts = opts.dup
    copy_opts["description"] = copy_opts.delete("desc")
    copy_opts["has_projects"] = copy_opts.delete("projects")
    copy_opts["has_issues"] = copy_opts.delete("issues")
    copy_opts["has_wiki"] = copy_opts.delete("wiki")
    expect(api_class).to receive(:create).with(copy_opts, format)
    subject.invoke "repo:create", [repo], opts
  end

  it "invokes repo:create org/name" do
    expect(api_class).to receive(:create).with({"name" => repo, "org" => org}, format)
    subject.invoke "repo:create", ["#{org}/#{repo}"]
  end

  it "invokes repo:create name --org" do
    expect(api_class).to receive(:create).with({"name" => repo, "org" => org}, format)
    subject.invoke "repo:create", [repo], :org => org
  end

  it "invokes repo:create name --wiki --issues --downloads --auto_init" do
    expect(api_class).to receive(:create).with({
     "name" => repo, "has_wiki" => true, "has_issues" => true, "has_projects" => true, "auto_init" => true}, format)
    subject.invoke "repo:create", [repo], :wiki => true, :issues => true,
      :projects => true, :auto => true
  end

  it "invokes repo:edit user repo name" do
    opts = {
      "desc" => "This is your first repository",
      "homepage" => "https://github.com",
      "private" => false,
      "issues" => true,
      "projects" => true,
      "wiki" => true
    }
    copy_opts = opts.dup
    copy_opts["name"] = "github_cli"
    copy_opts["description"] = copy_opts.delete("desc")
    copy_opts["has_projects"] = copy_opts.delete("projects")
    copy_opts["has_issues"] = copy_opts.delete("issues")
    copy_opts["has_wiki"] = copy_opts.delete("wiki")
    expect(api_class).to receive(:edit).with(user, repo, copy_opts, format)
    subject.invoke "repo:edit", [user, repo, "github_cli"], opts
  end

  it "invokes repo:edit user repo name --wiki --issues --downloads --auto_init" do
    expect(api_class).to receive(:edit).with(user, repo, {"name" => "new",
      "has_wiki" => true, "has_issues" => true, "has_projects" => true}, format)
    subject.invoke "repo:edit", [user, repo, "new"], :wiki => true,
      :issues => true, :projects => true
  end

  it "invokes repo:delete user repo" do
    expect(api_class).to receive(:delete).with(user, repo, {}, format)
    subject.invoke "repo:delete", [user, repo]
  end

  it "invokes repo:branches" do
    expect(api_class).to receive(:branches).with(user, repo, {}, format)
    subject.invoke "repo:branches", [user, repo]
  end

  it "invokes repo:branch" do
    expect(api_class).to receive(:branch).with(user, repo, "new", {}, format)
    subject.invoke "repo:branch", [user, repo, "new"]
  end

  it "invokes repo:contribs" do
    expect(api_class).to receive(:contributors).with(user, repo, {}, format)
    subject.invoke "repo:contribs", [user, repo]
  end

  it "invokes repo:langs" do
    expect(api_class).to receive(:languages).with(user, repo, {}, format)
    subject.invoke "repo:langs", [user, repo]
  end

  it "invokes repo:tags" do
    expect(api_class).to receive(:tags).with(user, repo, {}, format)
    subject.invoke "repo:tags", [user, repo]
  end

  it "invokes repo:teams" do
    expect(api_class).to receive(:teams).with(user, repo, {}, format)
    subject.invoke "repo:teams", [user, repo]
  end
end
