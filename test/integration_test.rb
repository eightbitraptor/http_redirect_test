require 'http_redirect_test'

class IntegrationTest < HTTPRedirectTest
  set_domain "localhost:4567"

  should_not_redirect '/ok'

  should_redirect '/redirect', to: '/ok'
  should_redirect '/redirect_permanant', to: '/ok', permanent: false

  should_not_be_found '/not_found'
  should_be_gone '/gone'

  should_have_header('/custom_header', 'X-One-Million-Years', with_value: 'Dungeon')
end
