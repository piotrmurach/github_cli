if defined?(require_relative)
  def require_api(path)
    require_relative "apis/#{path}"
  end
else
  def require_api(path)
    require "github_cli/apis/#{path}"
  end
end

Dir[File.dirname(__FILE__) + '/apis/*.rb'].sort.each do |path|
  filename = File.basename(path)
  require_api(filename)
end
