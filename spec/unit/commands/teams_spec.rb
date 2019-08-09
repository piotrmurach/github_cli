# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Teams do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:org)    { "rails" }
  let(:id)     { 1 }
  let(:api_class) { GithubCLI::Team }

  it "invokes team:list" do
    expect(api_class).to receive(:all).with(org, {}, format)
    subject.invoke "team:list", [org]
  end

  it "invokes team:get" do
    expect(api_class).to receive(:get).with(id, {}, format)
    subject.invoke "team:get", [id]
  end

  it "invokes team:create --name" do
    opts = {
      "name" => "Justice League",
      "description" => "A great team",
      "permission" => "admin",
      "privacy" => "closed"
    }
    copy_opts = opts.dup
    copy_opts["desc"] = copy_opts.delete("description")
    expect(api_class).to receive(:create).with(org, opts, format)
    subject.invoke "team:create", [org], copy_opts
  end

  it "invokes team:edit --name" do
    opts = {
      "name" => "new team name",
      "description" => "new team description",
      "privacy" => "closed"
    }
    copy_opts = opts.dup
    copy_opts["desc"] = copy_opts.delete("description")
    expect(api_class).to receive(:edit).with(id, opts, format)
    subject.invoke "team:edit", [id], copy_opts
  end

  it "invokes team:delete" do
    expect(api_class).to receive(:delete).with(id, {}, format)
    subject.invoke "team:delete", [id]
  end

  it "invokes team:list_member" do
    expect(api_class).to receive(:all_member).with(id, {}, format)
    subject.invoke "team:list_member", [id]
  end

  it "invokes team:member" do
    expect(api_class).to receive(:member).with(id, user, {}, format)
    subject.invoke "team:member", [id, user]
  end

  it "invokes team:add_member" do
    expect(api_class).to receive(:add_member).with(id, user, {}, format)
    subject.invoke "team:add_member", [id, user]
  end

  it "invokes team:remove_member" do
    expect(api_class).to receive(:remove_member).with(id, user, {}, format)
    subject.invoke "team:remove_member", [id, user]
  end

  it "invokes team:list_repo" do
    expect(api_class).to receive(:all_repo).with(id, {}, format)
    subject.invoke "team:list_repo", [id]
  end

  it "invokes team:repo" do
    expect(api_class).to receive(:repo).with(id, user, repo, {}, format)
    subject.invoke "team:repo", [id, user, repo]
  end

  it "invokes team:add_repo" do
    expect(api_class).to receive(:add_repo).with(id, user, repo, {}, format)
    subject.invoke "team:add_repo", [id, user, repo]
  end

  it "invokes team:remove_repo" do
    expect(api_class).to receive(:remove_repo).with(id, user, repo, {}, format)
    subject.invoke "team:remove_repo", [id, user, repo]
  end
end
