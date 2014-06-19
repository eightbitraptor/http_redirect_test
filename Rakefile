require "rubygems"
require "rake/testtask"

task :default => :test

desc 'Run the tests.'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/unit/*.rb'
  t.libs = ['lib', 'test']
end

desc 'Run the integration tests'
task :integration_test do
  pid = Process.spawn('ruby test/test_app/test_redirect_server.rb')
  sleep 2

  begin
    $LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
    require_relative 'test/integration_test.rb'
    MiniTest.run
  ensure
    Process.kill(9, pid)
  end
end
