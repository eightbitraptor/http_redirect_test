require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"
require "rake/testtask"

task :default => :test

spec = Gem::Specification.new do |s|
  
  # Change these as appropriate
  s.name              = "http_redirect_test"
  s.version           = "0.1.1"
  s.summary           = "A subclass of Test::Unit::TestCase to allow for http redirect testing, packaged from a gist by Patrick Reagan of Viget Labs"
  s.author            = "Matt House"
  s.email             = "matt@theshadowaspect.com"
  s.homepage          = "http://github.com/shadowaspect/http_redirect_test"

  s.has_rdoc          = false
  
  s.files             = Dir.glob("lib/**/*.rb")
  s.require_paths     = ["lib"]

end


Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
  
  # Generate the gemspec file for github.
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

desc 'Test the compiled binary.'
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/**/*.rb'
  t.verbose = true
end