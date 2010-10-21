require "rubygems"
require "rake/testtask"

task :default => :test

desc 'Run the tests.'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*.rb'
  t.verbose = true
end
