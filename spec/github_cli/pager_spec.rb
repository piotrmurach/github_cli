require 'spec_helper'

describe GithubCLI::Pager do

  context '#pager_command' do
    it 'chooses default pagers if none present' do
      GithubCLI::System.stub(:command?) { true }
      described_class.pager_command.to_s.should =~ /less/
    end

    it 'permits custom commands' do
      cmd = 'mine'
      GithubCLI::System.stub(:command?) { true }
      described_class.pager_command(cmd).should == cmd
    end
  end

  context '#page' do
    let(:read_io) { stub(:read_io).as_null_object }
    let(:write_io) { stub(:write_io).as_null_object }
    let(:pager) { described_class.new }

    before do
      $stdout.stub(:tty?).and_return true
      IO.stub(:pipe).and_return [read_io, write_io]
    end

    context 'child process' do
      before { Kernel.stub(:fork) { false } }

      it 'pipes to standard output' do
        Kernel.stub(:fork) { false}
        $stdout.should_receive(:reopen).with(write_io)
        $stderr.should_receive(:reopen).with(write_io)
        pager.page
      end

      it 'closes pipe' do
        $stdout.stub(:reopen)
        $stderr.stub(:reopen)
        write_io.should_receive(:close)
        read_io.should_receive(:close)
        pager.page
      end
    end

    context 'parent process' do
      before do
        Kernel.stub(:fork) { true }
        Kernel.stub(:select)
        described_class.stub(:pager_command) { 'less' }
        Kernel.stub(:exec)
      end

      it 'reads from standard output' do
        $stdin.should_receive(:reopen).with(read_io)
        pager.page
      end

      it 'closes pipe' do
        $stdin.stub(:reopen)
        write_io.should_receive(:close)
        read_io.should_receive(:close)
        pager.page
      end
    end
  end

end # GithubCLI::Pager
