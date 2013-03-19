# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "cucumber/rake/task"

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => [:spec, :features]

task :release => ["man:clean", "man:build"]

task :features do
  sh 'bundle exec cucumber -f progress -t @ci-run features'
end

begin
  require 'ronn'

  namespace :man do

    directory "lib/github_cli/man"

    FileList["man/*.ronn"].each do |ronn|
      basename = File.basename(ronn, ".ronn")
      roff = "lib/github_cli/man/#{basename}"

      file roff => ["lib/github_cli/man", ronn] do
        sh "#{Gem.ruby} -S ronn --roff --pipe #{ronn} > #{roff}"
      end

      file "#{roff}.txt" => roff do
        sh "groff -Wall -mtty-char -mandoc -Tascii #{roff} | col -b > #{roff}.txt"
      end

      task :build_all_pages => "#{roff}.txt"
    end

    desc "Build the man pages"
    task :build => "man:build_all_pages"

    desc 'Clean up the buit man pages'
    task :clean do
      rm_rf "lib/github_cli/man"
    end
  end
end

namespace :vendor do
  desc "Build"
  task :build => :clean do
    sh "git clone git://github.com/wycats/thor.git lib/github_cli/vendor/tmp"
    sh "mkdir lib/github_cli/vendor/thor"
    sh "mv lib/github_cli/vendor/tmp/lib/* lib/github_cli/vendor/"
    rm_rf "lib/github_cli/vendor/tmp"
  end

  task :clean do
    rm_rf "lib/github_cli/vendor"
  end
end
