Dir[File.dirname(__FILE__) + '/apis/*.rb'].sort.each do |path|
  filename = File.basename(path)
  require_relative("apis/#{filename}")
end
