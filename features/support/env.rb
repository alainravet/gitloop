require 'aruba/cucumber'
require 'methadone/cucumber'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"
LIB_DIR = File.join(File.expand_path(File.dirname(__FILE__)),'..','..','lib')
require LIB_DIR + '/gitloop'

FIXTURES_PATH = File.join(File.expand_path(File.dirname(__FILE__)),'fixtures')

Before do
  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
  @original_rubylib = ENV['RUBYLIB']
  ENV['RUBYLIB'] = LIB_DIR + File::PATH_SEPARATOR + ENV['RUBYLIB'].to_s
end

After do
  ENV['RUBYLIB'] = @original_rubylib
  FileUtils.rm_rf File.join(File.dirname(__FILE__), '../../tmp/aruba')
end
