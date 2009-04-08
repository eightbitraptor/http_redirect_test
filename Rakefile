require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

task :default => :package do
  puts "Don't forget to write some tests!"
end

spec = Gem::Specification.new do |s|
  
  # Change these as appropriate
  s.name              = "http_redirect_test"
  s.version           = "0.1.0"
  s.summary           = "A subclass of Test::Unit::TestCase to allow for http redirect testing, packaged from a gist by Patrick Reagan of Viget Labs"
  s.author            = "Matt House"
  s.email             = "matt@theshadowaspect.com"
  s.homepage          = "http://github.com/shadowaspect"

  s.has_rdoc          = false
  
  s.files             = Dir.glob("lib/**/*.rb")
  s.require_paths     = ["lib"]

end

# This task actually builds the gem. We also regenerate a static 
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
  
  # Generate the gemspec file for github.
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end
