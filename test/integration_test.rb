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
    should_redirect '/redirect_permanant', to: '/ok', permanent: false
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
