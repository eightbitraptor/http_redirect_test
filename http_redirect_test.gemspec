Gem::Specification.new do |s|
  s.name = "http_redirect_test"
  s.version = "0.1.3"

  s.authors = ["Matt House"]
  s.date = %q{2010-10-21}
  s.email = "matt@eightbitraptor.com"
  s.files = Dir.glob("{lib,test}/**/*.rb")
  s.homepage = "http://github.com/eightbitraptor/http_redirect_test"
  s.require_paths = ["lib"]
  s.summary = "Test Apache behavior using Test::Unit, based on a gist by Patrick Reagan of Viget Labs"

  s.add_development_dependency "mocha", ">=0.9.5"
end
