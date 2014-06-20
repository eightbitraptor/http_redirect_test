Gem::Specification.new do |s|
  s.name = "http_redirect_test"
  s.version = "1.0.1"

  s.authors = ["Matt House"]
  s.date = %q{2014-06-20}
  s.email = "matt@eightbitraptor.com"
  s.files = Dir.glob("{lib}/**/*.rb")
  s.homepage = "http://github.com/eightbitraptor/http_redirect_test"
  s.require_paths = ["lib"]
  s.summary = "Test Apache behavior using Test::Unit, based on a gist by Patrick Reagan of Viget Labs"

  s.add_dependency "minitest", "~> 5.3.5"
  s.add_development_dependency "mocha", "~> 1.1.0"
  s.add_development_dependency "rake", "~> 10.3.0"
  s.add_development_dependency "sinatra", "~> 1.4.5"
end
