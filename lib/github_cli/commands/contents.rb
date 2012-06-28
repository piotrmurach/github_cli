# encoding: utf-8

module GithubCLI
  class Commands::Contents < Command

    namespace :content

    desc 'get <user> <repo> <path>', 'Get repository <path> contents'
    long_desc <<-DESC
      This method returns the contents of any file or directory in a repository.

      Parameters

      ref - Optional string - The String name of the Commit/Branch/Tag. Defaults to master.
    DESC
    def get(user, repo, path)
      Content.get user, repo, path, options[:params], options[:format]
    end

    desc 'readme <user> <repo>', 'Get the README'
    long_desc <<-DESC
      Parameters

      ref - Optional string - The String name of the Commit/Branch/Tag. Defaults to master.
    DESC
    def readme(user, repo)
      Content.readme user, repo, options[:params], options[:format]
    end

    desc 'archive <user> <repo>', 'Get archive link'
    long_desc <<-DESC
      This method will return a 302 to a URL to download a tarball or zipball
      archive for a repository. Please make sure your HTTP framework is configured
      to follow redirects or you will need to use the Location header to make
      a second GET request.\n

      Note: For private repositories, these links are temporary and expire quickly.

      Parameters

      archive_format - Required string - either tarball or zipball\n
      ref - Optional string - valid Git reference, defaults to master\n
    DESC
    def archive(user, repo)
      Content.archive user, repo, options[:params], options[:format]
    end

  end # Contents
end # GithubCLI
