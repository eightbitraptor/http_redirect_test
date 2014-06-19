class HTTPRedirectTest < MiniTest::Test
  # permanent can be overriden in 2 ways, with a call to self.permanent to set globally. Or via the options array for each redirect call
  @permanent=nil

  def default_test; end # placeholder to stop Test::Unit from complaining

  module ClassMethods
    attr_reader :domain
    attr_writer :permanent

    def set_domain(domain)
      @domain = domain
    end

    def permanent?
      !!@permanent
    end
  end

  module InstanceMethods
    def should_not_redirect(path)
      check = RedirectCheck.new(self.class.domain, path)
      assert_equal false, check.redirected?, "#{path} is redirecting"
      assert_equal true, check.success?, "#{path} is not a success response"
    end

    def should_redirect(source, options)
      source_path = ResourcePath.new(source, :param => 'subdir').to_s
      destination_path = ResourcePath.new(options[:to], :param => 'subdir').to_s

      @permanent ||= options.fetch(:permanent, false)

      redirection = RedirectCheck.new(self.class.domain, source_path, destination_path)
      assert_equal true, redirection.redirected?, "'#{source_path}' is not redirecting"
      assert_equal destination_path, redirection.redirected_path,
                   "'#{source_path}' is not redirecting to '#{destination_path}'"

      if @permanent
        assert_equal true, redirection.permanent_redirect?,
                     "The redirection from '#{source_path}' to '#{destination_path}' doesn't appear to be a permanent redirect"
      end
    end

    def should_be_gone(path)
      check = RedirectCheck.new(self.class.domain, path)
      assert check.gone?
    end

    def should_not_be_found(path)
      check = RedirectCheck.new(self.class.domain, path)
      assert check.not_found?
    end

    def should_have_header(path, header, options)
      value = options[:with_value]
      check = RedirectCheck.new(self.class.domain, path)
      assert_equal value, check.header(header)
    end

    private

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

  extend ClassMethods
  include InstanceMethods
end
