# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Gists do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:id)    { 1 }
  let(:api_class) { GithubCLI::Gist }

  it "invokes gist:list" do
    expect(api_class).to receive(:all).with({}, format)
    subject.invoke "gist:list", []
  end

  it "invokes gist:list --public" do
    expect(api_class).to receive(:all).with({}, format.merge("public" => true))
    subject.invoke "gist:list", [], {:public => true}
  end

  it "invokes gist:list --user" do
    expect(api_class).to receive(:all).with({"user" => user}, format)
    subject.invoke "gist:list", [], :user => user
  end

  it "invokes gist:list --starred" do
    expect(api_class).to receive(:starred).with({}, format)
    subject.invoke "gist:list", [], :starred => true
  end

  it "invokes gist:get" do
    expect(api_class).to receive(:get).with(id, {}, format)
    subject.invoke "gist:get", [id]
  end

  it "invokes gist:create" do
    expect(api_class).to receive(:create).with({"public" => false}, format)
    subject.invoke "gist:create", []
  end

  it "invokes gist:create --public --desc" do
    expect(api_class).to receive(:create).with({"public" => true,
      "description" => "new"}, format)
    subject.invoke "gist:create", [], :desc => "new", :public => true
  end

  it "invokes gist:edit id" do
    expect(api_class).to receive(:edit).with(id, {}, format)
    subject.invoke "gist:edit", [id]
  end

  it "invokes gist:edit id --desc" do
    expect(api_class).to receive(:edit).with(id, {"description" => "new"}, format)
    subject.invoke "gist:edit", [id], :desc => "new"
  end

  it "invokes gist:star id" do
    expect(api_class).to receive(:star).with(id, {}, format)
    subject.invoke "gist:star", [id]
  end

  it "invokes gist:unstar id" do
    expect(api_class).to receive(:unstar).with(id, {}, format)
    subject.invoke "gist:unstar", [id]
  end

  it "invokes gist:starred id" do
    expect(api_class).to receive(:starred?).with(id, {}, format)
    subject.invoke "gist:starred", [id]
  end

  it "invokes gist:fork id" do
    expect(api_class).to receive(:fork).with(id, {}, format)
    subject.invoke "gist:fork", [id]
  end

  it "invokes gist:delete id" do
    expect(api_class).to receive(:delete).with(id, {}, format)
    subject.invoke "gist:delete", [id]
  end
end
