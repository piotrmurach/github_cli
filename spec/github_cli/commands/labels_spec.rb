# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Labels do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:name)   { "bug" }
  let(:api_class) { GithubCLI::Label }

  it "invokes label:list" do
    expect(api_class).to receive(:all).with(user, repo, {}, format)
    subject.invoke "label:list", [user, repo]
  end

  it "invokes label:list --milestone 1" do
    expect(api_class).to receive(:all).with(user, repo, {"milestone_id" => 1}, {"format" => "csv"})
    subject.invoke "label:list", [user, repo], :milestone => 1, :format => "csv"
  end

  it "invokes label:list --issue 1" do
    expect(api_class).to receive(:all).with(user, repo, {"issue_id" => 1}, format)
    subject.invoke "label:list", [user, repo], :issue => 1
  end

  it "invokes label:get" do
    expect(api_class).to receive(:get).with(user, repo, name, {}, format)
    subject.invoke "label:get", [user, repo, name]
  end

  it "invokes label:create" do
    opts = {
      "name" => "bug",
      "desc" => "Something isn't working",
      "color" => "f29513"
    }
    expect(api_class).to receive(:create).with(user, repo, {"name" => "bug", "description" => "Something isn't working", "color" => "f29513"}, format)
    subject.invoke "label:create", [user, repo], opts
  end

  it "invokes label:update" do
    expect(api_class).to receive(:update).with(user, repo, name, {}, format)
    subject.invoke "label:update", [user, repo, name]
  end

  it "invokes label:update" do
    opts = {
      "name" => "bug :bug:",
      "desc" => "Small bug fix required",
      "color" => "b01f26"
    }
    expect(api_class).to receive(:update).with(user, repo, name, {"name" => "bug :bug:", "description" => "Small bug fix required", "color" => "b01f26"}, format)
    subject.invoke "label:update", [user, repo, name], opts
  end

  it "invokes label:delete" do
    expect(api_class).to receive(:delete).with(user, repo, name, {}, format)
    subject.invoke "label:delete", [user, repo, name]
  end

  it "invokes lable:add" do
    expect(api_class).to receive(:add).with(user, repo, 1, [], {}, format)
    subject.invoke "label:add", [user, repo, 1]
  end

  it "invokes lable:remove" do
    expect(api_class).to receive(:remove).with(user, repo, "1", {}, format)
    subject.invoke "label:remove", [user, repo, "1"]
  end

  it "invokes lable:replace" do
    expect(api_class).to receive(:replace).with(user, repo, 1, [], {}, format)
    subject.invoke "label:replace", [user, repo, 1]
  end
end
