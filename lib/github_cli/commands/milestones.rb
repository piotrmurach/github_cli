# encoding: utf-8

module GithubCLI
  class Commands::Milestones < Command

    namespace :milestone

    desc 'list <user> <repo>', 'List milestones for a repository'
    long_desc <<-DESC
      Parameters

        state - open, closed, default: open\n
        sort - due_date, completeness, default: due_date\n
        direction - asc, desc, default: desc\n
    DESC
    def list(user, repo)
      Milestone.all user, repo, options[:params], options[:format]
    end

    desc 'get <user> <repo> <number>', 'Get a single milestone'
    def get(user, repo, number)
      Milestone.get user, repo, number, options[:params], options[:format]
    end

    desc 'create <user> <repo>', 'Create a milestone'
    long_desc <<-DESC
      Parameters

        title - Required string\n
        state - Optional string - open or closed\n
        description - Optional string\n
        due_on - Optional string - ISO 8601 time\n

      Example

      ghc milestone create wycats thor --params=title:new
    DESC
    def create(user, repo)
      Milestone.create user, repo, options[:params], options[:format]
    end

    desc 'update <user> <repo> <number>', 'Update a milestone'
    long_desc <<-DESC
      Parameters

        title - Required string\n
        state - Optional string - open or closed\n
        description - Optional string\n
        due_on - Optional string - ISO 8601 time\n

      Example

      ghc milestone update wycats thor 1 --params=title:new
    DESC
    def update(user, repo, number)
      Milestone.update user, repo, number, options[:params], options[:format]
    end

    desc 'delete <user> <repo> <number>', 'Delete a milestone'
    def delete(user, repo, number)
      Milestone.delete user, repo, number, options[:params], options[:format]
    end

  end # Milestones
end # GithubCLI
