# encoding: utf-8

module GithubCLI
  class Email < API

    class << self

      def all(params, options)
        output options do
          github_api(options).users.emails.list params
        end
      end

      def add(emails, params, options)
        output options do
          github_api(options).users.emails.add emails, params
        end
      end

      def delete(emails, params, options)
        output options do
          github_api(options).users.emails.delete emails, params
        end
      end
    end

  end # Email
end # GithubCLI
