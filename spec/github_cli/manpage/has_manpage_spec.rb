# encoding: utf-8

require 'spec_helper'

RSpec.describe GithubCLI::Manpage, '#manpage?' do

  before do
    source = File.join(source_root, 'man')
    GithubCLI::Manpage.man_dir(source)
  end

  after do
    GithubCLI::Manpage.man_dir(nil)
  end

  it "finds no manpages for nil argument" do
    expect(GithubCLI::Manpage.manpage?(nil)).to eq(false)
  end

  it "finds no mnapage for unknown name" do
    expect(GithubCLI::Manpage.manpage?('unknown')).to eq(false)
  end

  it "finds matching manpage based on section name" do
    expect(GithubCLI::Manpage.manpage?('config')).to eq(true)
  end
end
