# encoding: utf-8

module GithubCLI
  class Commands::Members < Command

    namespace :member

    desc 'list <org>', "Lists an organization members"
    long_desc <<-DESC
      List all users who are members of an organization. A member is a user
      that belongs to at least 1 team in the organization.

      If the authenticated user is also a member of this organization then
      both concealed and public members will be returned.
      Otherwise only public members are returned.

      Members of an organization can choose to have their membership publicized or not.
    DESC
    method_option :public, :type => :boolean, :default => false,
                  :desc => 'List public members'
    def list(org)
      if options[:public]
        Member.all_public org, options[:params], options[:format]
      else
        Member.all org, options[:params], options[:format]
      end
    end

    desc 'member <org> <user>', 'Checks if user is a member of an organization'
    method_option :public, :type => :boolean, :default => false,
                  :desc => 'Get if a user is a public member of an organization'
    def member(org, user)
      if options[:public]
        Member.public_member? org, user, options[:params], options[:format]
      else
        Member.member? org, user, options[:params], options[:format]
      end
    end

    desc 'delete <org> <user>', 'Remove a member from an organization'
    long_desc <<-DESC
      Removing a user from this list will remove them from all teams and they
      will no longer have any access to the organization’s repositories.
    DESC
    def delete(org, user)
      Member.delete org, user, options[:params], options[:format]
    end

    desc 'publicize <org> <user>', "Publicize a user’s membership"
    def publicize(org, user)
      Member.publicize org, user, options[:params], options[:format]
    end

    desc 'conceal <org> <user>', "Conceal a user’s membership"
    def conceal(org, user)
      Member.conceal org, user, options[:params], options[:format]
    end

  end # Members
end # GithubCLI
