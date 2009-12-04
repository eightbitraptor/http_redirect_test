require 'uri'
require 'net/http'

class RedirectCheck
  attr_reader :source_path, :destination_path

  def initialize(domain, source_path, destination_path = nil)
    @domain = domain
    @source_path = source_path.to_s
    @destination_path = destination_path.to_s
  end

  def uri
    URI.parse("http://#{@domain}#{source_path}")
  end

  def response
    @response ||= Net::HTTP.start(uri.host, uri.port) {|http| return http.head(uri.path) }
  end

  def success?
    response.is_a?(Net::HTTPOK)
  end

  def redirected?
    response.is_a?(Net::HTTPRedirection)
  end

  def permanent_redirect?
    redirected? && response.is_a?(Net::HTTPMovedPermanently)
  end

  def redirected_path
    response['location'].sub(/#{Regexp.escape("#{uri.scheme}://#{uri.host}")}/, '') if redirected?
  end

end
