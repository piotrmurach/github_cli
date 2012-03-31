require 'spec_helper'

describe GithubCLI::Command do

  context '#all' do
    let(:task) { stub(:task, :name => 'create').as_null_object }
    let(:klass) { GithubCLI::Repositories }

    before do
      task.stub(:last) { task }
    end

    it "tracks all the commands in array" do
      Thor::Base.stub(:subclasses) { [klass, klass] }
      klass.stub(:tasks) { [task, task] }
      described_class.all.should have(4).items
    end

    it "skips help commands" do
      task_help = stub(:task, :name => 'help')
      task_help.stub(:last) { task_help }
      Thor::Base.stub(:subclasses) { [klass] }
      klass.stub(:tasks) { [task, task_help, task] }
      described_class.all.should have(2).items
      described_class.all.each do |cmd|
        cmd.name.should_not == 'help'
      end
    end
  end # all

end # GithubCLI::Command
