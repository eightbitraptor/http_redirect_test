require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

task :default => :package do
  puts "Don't forget to write some tests!"
end

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|
  
  # Change these as appropriate
  s.name              = "http_redirect_test"
  s.version           = "0.1.0"
  s.summary           = "What this thing does"
  s.author            = "Your name"
  s.email             = "you@example.com"
  s.homepage          = "http://example.com"

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
