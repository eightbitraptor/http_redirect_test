# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{http_redirect_test}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt House"]
  s.date = %q{2009-04-08}
  s.email = %q{matt@theshadowaspect.com}
  s.files = ["lib/http_redirect_test/http_redirect_test.rb", "lib/http_redirect_test/redirect_check.rb", "lib/http_redirect_test/resource_path.rb", "lib/http_redirect_test.rb"]
  s.homepage = %q{http://github.com/shadowaspect}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A subclass of Test::Unit::TestCase to allow for http redirect testing, packaged from a gist by Patrick Reagan of Viget Labs}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
