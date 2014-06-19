class HTTPRedirectTest < MiniTest::Test
  @permanent=nil

  class << self
    attr_reader :domain, :permanent

    def set_domain(domain)
      @domain = domain
    end

    def treat_all_redirects_as_permanent
      @permanent = true
    end

    def permanent?
      !!@permanent
    end
  end

  def should_not_redirect(path)
    assert_equal false, check_for(path).redirected?, "#{path} is redirecting"
    assert_equal true, check_for(path).success?, "#{path} is not a success response"
  end

  def should_redirect(source, options)
    source_path = ResourcePath.new(source, :param => 'subdir').to_s
    destination_path = ResourcePath.new(options[:to], :param => 'subdir').to_s

    redirection = check_for(source_path, destination_path)
    assert_equal true, redirection.redirected?, "'#{source_path}' is not redirecting"
    assert_equal destination_path, redirection.redirected_path,
                 "'#{source_path}' is not redirecting to '#{destination_path}'"

    if permanent? || options[:permanent]
      assert_equal true, redirection.permanent_redirect?,
                   "The redirection from '#{source_path}' to '#{destination_path}' doesn't appear to be a permanent redirect"
    end
  end

  def should_be_gone(path)
    assert check_for(path).gone?
  end

  def should_not_be_found(path)
    assert check_for(path).not_found?
  end

  def should_have_header(path, header, options)
    value = options[:with_value]
    assert_equal value, check_for(path).header(header)
  end

  private

  def check_for(path, destination=nil)
    RedirectCheck.new(self.class.domain, path, destination)
  end

  def permanent?
    !!self.class.permanent
  end

  def name_for(path)
    if path.empty?
      'root'
    else
      path.strip.gsub(/\W+/, '_')
    end
  end
end
