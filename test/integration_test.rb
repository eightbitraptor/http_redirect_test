require 'http_redirect_test'

class IntegrationTest < HTTPRedirectTest
  set_domain "localhost:4567"

  def test_not_redirect
    should_not_redirect '/ok'
  end

  def test_should_redirect_non_permanantly
    should_redirect '/redirect', to: '/ok'
  end

  def should_redirect_permanently
    should_redirect '/redirect_permanant', to: '/ok', permanent: true
  end

  def test_should_not_be_found
    should_not_be_found '/not_found'
  end

  def test_should_be_gone
    should_be_gone '/gone'
  end

  def test_custom_header
    should_have_header('/custom_header', 'X-One-Million-Years', with_value: 'Dungeon')
  end
end

class AllRedirectsArePermanent < HTTPRedirectTest
  set_domain "localhost:4567"
  treat_all_redirects_as_permanent

  def test_should_redirect
    should_redirect '/redirect_permanant', to: '/ok'
  end

  def test_non_permanent_redirect_should_fail
    assertion_failed = begin
      should_redirect '/redirect', to: '/ok'
      false
        rescue MiniTest::Assertion
      true
    end

    assert assertion_failed
  end
end
