require 'fileutils'

Before do
  @aruba_timeout_seconds = 10
  @aruba_io_wait_seconds = 0.2

  @real_home = ENV['HOME']
  fake_home = File.join('/tmp', 'fakehome')
  FileUtils.rm_rf fake_home if File.exists? fake_home
  FileUtils.mkdir_p fake_home
  ENV['HOME'] = fake_home
end

After do
  ENV['HOME'] = @real_home
end
