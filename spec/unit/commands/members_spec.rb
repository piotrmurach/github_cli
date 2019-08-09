# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Members do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:repo)   { "github_cli" }
  let(:org)    { "github" }
  let(:api_class) { GithubCLI::Member }

  it "invokes member:list" do
    expect(api_class).to receive(:all).with(org, {}, format)
    subject.invoke "member:list", [org]
  end

  it "invokes member:list --public" do
    expect(api_class).to receive(:all).with(org, {"public" => true}, format)
    subject.invoke "member:list", [org], {:public => true}
  end

  it "invokes member:member" do
    expect(api_class).to receive(:member?).with(org, user, {}, format)
    subject.invoke "member:member", [org, user]
  end

  it "invokes member:member --public" do
    expect(api_class).to receive(:member?).with(org, user, {}, format)
    subject.invoke "member:member", [org, user]
  end

  it "invokes member:delete" do
    expect(api_class).to receive(:delete).with(org, user, {}, format)
    subject.invoke "member:delete", [org, user]
  end

  it "invokes member:publicize" do
    expect(api_class).to receive(:publicize).with(org, user, {}, format)
    subject.invoke "member:publicize", [org, user]
  end

  it "invokes member:conceal" do
    expect(api_class).to receive(:conceal).with(org, user, {}, format)
    subject.invoke "member:conceal", [org, user]
  end
end
