if defined?(require_relative)
  def require_api(path)
    require_relative "apis/#{path}"
  end
else
  def require_api(path)
    require "github_cli/apis/#{path}"
  end
end

%w[
  authorization
  blob
  collaborator
  commit
  download
  email
  follower
  fork
  gist
  hook
  issue
  key
  label
  member
  milestone
  organization
  pull_request
  reference
  repository
  search
  tag
  team
  tree
  user
  watching
].each do |api|
  require_api api
end
