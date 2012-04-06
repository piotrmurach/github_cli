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
  blob
  repository
  tag
  tree
].each do |api|
  require_api api
end
