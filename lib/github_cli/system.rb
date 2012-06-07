# encoding: utf-8

module GithubCLI
  # This class provides methods for reading system settings.
  class System
    class << self

      # Checks if windows platform.
      def windows?
        require 'rbconfig'
        RbConfig::CONFIG['host_os'] =~ /msdos|mswin|djgpp|mingw|windows/
      end

      # Finds executable in $PATH.
      def which(command)
        exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
        ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
          exts.each do |ext|
            exe = "#{path}/#{command}#{ext}"
            return exe if File.executable? exe
          end
        end
        return nil
      end

      # Checks if command exists.
      def command?(name)
        !which(name).nil?
      end

    end
  end # System
end # GithubCLI
