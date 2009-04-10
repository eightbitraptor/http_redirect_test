require File.join(File.dirname(__FILE__), "..", "test_helper")
require 'http_redirect_test'

class HttpRedirectTestTests < Test::Unit::TestCase
  def test_that_permanent_flag_is_being_set_correctly
    assert_equal false,  HTTPRedirectTest.permanent?
    HTTPRedirectTest.permanent=true
    assert_equal true,  HTTPRedirectTest.permanent?
  end
end