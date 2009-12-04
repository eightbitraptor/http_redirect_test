require File.join(File.dirname(__FILE__), "..", "test_helper")
require 'http_redirect_test'

class HttpRedirectTestTests < Test::Unit::TestCase
  def test_that_permanent_flag_is_being_set_correctly
    assert_equal false,  HTTPRedirectTest.permanent?
    HTTPRedirectTest.permanent=true
    assert_equal true,  HTTPRedirectTest.permanent?
  end

  def test_each_class_should_have_its_own_domain
    a = Class.new(HTTPRedirectTest)
    a.__send__(:domain=, "a.example.com")
    b = Class.new(HTTPRedirectTest)
    b.__send__(:domain=, "b.example.com")
    assert_equal "a.example.com", a.__send__(:domain)
    assert_equal "b.example.com", b.__send__(:domain)
  end
end
