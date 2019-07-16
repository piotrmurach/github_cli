# frozen_string_literal: true

RSpec.describe GithubCLI::Manpage, '#manpages' do

  before do
    source = File.join(source_root, 'man')
    GithubCLI::Manpage.man_dir(source)
  end

  after do
    GithubCLI::Manpage.man_dir(nil)
  end

  it "returns all manpages when no criteria provided" do
    expect(GithubCLI::Manpage.manpages).to eq(['gcli-config.1', 'gcli-whoami.1'])
  end

  it "finds no matching manpage based on section name" do
    expect(GithubCLI::Manpage.manpages('unknown')).to eq([])
  end

  it "finds matching manpage based on section name" do
    expect(GithubCLI::Manpage.manpages('config')).to eq(['gcli-config.1'])
  end
end
