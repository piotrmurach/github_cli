# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Emails do
  let(:format) { {"format" => "table"} }
  let(:user)   { "piotrmurach" }
  let(:api_class) { GithubCLI::Email }

  it "invokes email:list" do
    expect(api_class).to receive(:all).with({}, format)
    subject.invoke "email:list", []
  end

  it "invokes email:add" do
    expect(api_class).to receive(:add).with(["email1", "email2"], {}, format)
    subject.invoke "email:add", ["email1", "email2"]
  end

  it "invokes email:delete" do
    expect(api_class).to receive(:delete).with(["email1", "email2"], {}, format)
    subject.invoke "email:delete", ["email1", "email2"]
  end
end
