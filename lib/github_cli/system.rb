# encoding: utf-8

module GithubCLI
  # This class provides methods for reading system settings.
  class System
    # Checks if command exists.
    def self.command?(name)
      !TTY::Which.which(name).nil?
    end
  end # System
end # GithubCLI
