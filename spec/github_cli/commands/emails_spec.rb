# frozen_string_literal: true

RSpec.describe GithubCLI::Commands::Emails do
  let(:format) { {'format' => 'table'} }
  let(:user)   { 'peter-murach' }
  let(:api_class) { GithubCLI::Email }

  it "invokes email:list" do
    api_class.should_receive(:all).with({}, format)
    subject.invoke "email:list", []
  end

  it "invokes email:add" do
    api_class.should_receive(:add).with(['email1', 'email2'], {}, format)
    subject.invoke "email:add", ['email1', 'email2']
  end

  it "invokes email:delete" do
    api_class.should_receive(:delete).with(['email1', 'email2'], {}, format)
    subject.invoke "email:delete", ['email1', 'email2']
  end
end
