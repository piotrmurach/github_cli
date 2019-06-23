# frozen_string_literal: true

RSpec.describe GithubCLI::Command do
  context '#all' do
    let(:task) { double(:task, :name => 'create').as_null_object }
    let(:klass) { GithubCLI::Commands::Repositories }

    before do
      allow(task).to receive(:last) { task }
    end

    it "tracks all the commands in array" do
      allow(Thor::Base).to receive(:subclasses) { [klass, klass] }
      allow(klass).to receive(:tasks) { [task, task] }
      expect(described_class.all.size).to eql(4)
    end

    it "skips help commands" do
      task_help = double(:task, :name => 'help')
      allow(task_help).to receive(:last) { task_help }
      allow(Thor::Base).to receive(:subclasses) { [klass] }
      allow(klass).to receive(:tasks) { [task, task_help, task] }

      expect(described_class.all.size).to eql(2)
      described_class.all.each do |cmd|
        expect(cmd.name).to_not eql('help')
      end
    end
  end
end # GithubCLI::Command
