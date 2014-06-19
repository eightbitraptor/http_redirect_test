class IntegrationTest < MiniTest::Test
  def test_truth
    response = Net::HTTP.get_response(uri_for('/ok'))

    assert has_code?(response, 200)
  end

  private

  def uri_for(path)
    URI.parse("http://localhost:4567#{path}")
  end

  def has_code?(response, code)
    Integer(response.code) == code
  end
end
