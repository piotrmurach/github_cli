# encoding: utf-8

require "bundler/gem_tasks"

FileList['tasks/**/*.rake'].each(&method(:import))

require "cucumber/rake/task"

task default: [:spec, :features]

desc 'Run all tests'
task ci: %w[spec features]

task :release => ["man:clean", "man:build"]

task :features do
  sh 'bundle exec cucumber -f progress -t @ci-run features'
end

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
