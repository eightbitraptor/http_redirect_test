require 'test_helper'
require 'net/http'

class RedirectCheckTest < MiniTest::Unit::TestCase

  def test_that_redirect_checker_returns_legitimate_response
    stub_http_head_request(Net::HTTPOK)
    assert_equal @http_head, RedirectCheck.new("example.com", "/index.html").response
  end

  def test_that_http_ok_results_in_success
    stub_http_head_request(Net::HTTPOK)
    assert RedirectCheck.new("example.com", "/index.html").success?
  end

  def test_that_http_redirection_resuts_in_positive_redirection
    stub_http_head_request(Net::HTTPRedirection)
    assert RedirectCheck.new("example.com", "/index.html").redirected?
  end

  def test_that_http_301_resuts_in_permanent_redirection
    stub_http_head_request(Net::HTTPMovedPermanently)
    assert RedirectCheck.new("example.com", "/index.html").permanent_redirect?
  end

  def test_that_gone_page_returns_correctly
    stub_http_head_request(Net::HTTPGone)
    assert RedirectCheck.new("example.com", "/index.html").gone?
  end

  def test_that_not_found_page_returns_correctly
    stub_http_head_request(Net::HTTPNotFound)
    assert RedirectCheck.new("example.com", "/index.html").not_found?
  end

  def test_that_uri_can_be_built_correctly
    assert_equal RedirectCheck.new("example.com", "/index.html").uri, URI.parse("http://example.com/index.html")
  end

  def test_redirection_path
    stub_http_head_request(Net::HTTPMovedPermanently)
    r = RedirectCheck.new("example.com", "/index.html")
    r.response['location'] = "http://www.someurl.com"

    assert_equal "http://www.someurl.com", r.redirected_path
  end

  def test_redirection_path_without_query_params
    assert_equal "/index.html", RedirectCheck.new("example.com", "/index.html").source_uri
  end

  def test_redirection_path_with_query_params
    assert_equal "/index.html?foo=bar", RedirectCheck.new("example.com", "/index.html?foo=bar").source_uri
  end

  def test_request_for_specific_header
    stub_http_header('X-Powered-By', 'Pixies and Stardust')
    assert RedirectCheck.new("example.com", "/index.html").header('X-Powered-By') == "Pixies and Stardust"
  end

private
  def stub_http_head_request(response_type)
    @http_head = response_type.new(stub, stub, stub)
    @http_session = stub(:session)
    @http_session.stubs(:head).with("/index.html").returns(@http_head)
    Net::HTTP.stubs(:start).with("example.com", 80).yields(@http_session)
  end

  def stub_http_header(header_name, value)
    @http_head = Net::HTTPOK.new(stub, stub, stub)
    @http_head.stubs(:key?).with(header_name).returns(true)
    @http_head.stubs(:fetch).with(header_name).returns(value)
    @http_session = stub(:session)
    @http_session.stubs(:head).with("/index.html").returns(@http_head)
    Net::HTTP.stubs(:start).with("example.com", 80).yields(@http_session)
  end
end
