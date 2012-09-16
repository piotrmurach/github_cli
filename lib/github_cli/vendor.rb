# encoding: utf-8

if defined?(Thor)
  GithubCLI.ui.warn "Thor has already been required. "
end

vendor_dir = File.expand_path('../vendor', __FILE__)
$:.unshift(vendor_dir) unless $:.include?(vendor_dir)

require 'thor'
require 'thor/group'
require 'thor/actions'
