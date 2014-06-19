require 'test_helper'

class HttpRedirectTestTests < MiniTest::Test
  def test_that_permanent_flag_is_being_set_correctly
    assert_equal false,  HTTPRedirectTest.permanent?

    HTTPRedirectTest.treat_all_redirects_as_permanent

    assert_equal true,  HTTPRedirectTest.permanent?
  end

  def test_each_class_should_have_its_own_domain
    a = Class.new(HTTPRedirectTest)
    a.set_domain "a.example.com"
    b = Class.new(HTTPRedirectTest)
    b.set_domain "b.example.com"
    assert_equal "a.example.com", a.__send__(:domain)
    assert_equal "b.example.com", b.__send__(:domain)
  end
end
