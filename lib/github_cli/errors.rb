# encoding: utf-8

module GithubCLI

  class GithubCLIError < StandardError
    def self.status_code(code)
      define_method(:status_code) { code }
    end
  end

  class ApiError < GithubCLIError
    status_code 5
  end

  # Raised when a configuration file is corrupt or missing.
  class ConfigFileNotFound < GithubCLIError
    status_code 10

    def initialize
      super %{Configuration file corrupt or missing}
    end
  end

  # Raised when GitHub api raised error
  class GitHubError < GithubCLIError
    status_code 11
  end

  class HTTPError < GithubCLIError
    status_code 12
  end

  class UnknownFormatError < GithubCLIError
    status_code 13

    def initialize(format)
      super %{Unrecognized formatting options: #{format}}
    end
  end


end # GithubCLI
