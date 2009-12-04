require File.join(File.dirname(__FILE__), "..", "test_helper")
require 'http_redirect_test'


class RedirectCheckTest < Test::Unit::TestCase

  require 'net/http'

  def test_that_redirect_checker_returns_legitimate_response
    stub_http_head_request(Net::HTTPOK)
    assert_equal @http_head, RedirectCheck.new("/index.html").response
  end

  def test_that_http_ok_results_in_success
    stub_http_head_request(Net::HTTPOK)
    assert RedirectCheck.new("/index.html").success?
  end

  def test_that_http_redirection_resuts_in_positive_redirection
    stub_http_head_request(Net::HTTPRedirection)
    assert RedirectCheck.new("/index.html").redirected?
  end

  def test_that_http_301_resuts_in_permanent_redirection
    stub_http_head_request(Net::HTTPMovedPermanently)
    assert RedirectCheck.new("/index.html").permanent_redirect?
  end

  def test_that_uri_can_be_built_correctly
    RedirectCheck.domain = "www.theshadowaspect.com"
    assert_equal RedirectCheck.new("/index.html").uri, URI.parse("http://www.theshadowaspect.com/index.html")
  end

  def test_redirection_path
    stub_http_head_request(Net::HTTPMovedPermanently)
    r = RedirectCheck.new("/index.html")
    r.response['location'] = "http://www.someurl.com"

    assert_equal "http://www.someurl.com", r.redirected_path
  end

private
  def stub_http_head_request(response_type)
    RedirectCheck.domain = "www.theshadowaspect.com"
    @http_head = response_type.new(stub, stub, stub)
    @http_session = stub(:session)
    @http_session.stubs(:head).with("/index.html").returns(@http_head)
    Net::HTTP.stubs(:start).with("www.theshadowaspect.com", 80).yields(@http_session)
  end
end