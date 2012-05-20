# encoding: utf-8

module GithubCLI
  class Email < API

    class << self

      def all(params, format)
        output format do
          github_api.users.emails.list params
        end
      end

      def add(emails, params, format)
        output format do
          github_api.users.emails.add emails, params
        end
      end

      def delete(emails, params, format)
        output format do
          github_api.users.emails.delete emails, params
        end
      end
    end

  end # Email
end # GithubCLI
