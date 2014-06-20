http\_redirect\_test
==================

Version 1.0
-----------

Version 1 has drastically altered the syntax and strucutre of this gem, and is *NOT* backwards compatible with the old `0.1.3` release. You can now no longer use Ruby 1.8 with this gem.

If you absolutely **must** have the old version you can check out the `v0.1` tag. However please be aware that *this branch is over 4 years old* and as such you should really upgrade your url tests to work with the latest version.

This library is released under the LGPL v2.1 a copy is included in the `LICENSE.txt` file

Introduction
------------

Makes sure your apache set up is working as you expect it to and check for regressions by running a suite of tests against it just as you would for any web application.

Example
-------

simply subclass HTTPRedirectTest in your tests and set the domain that you want to test

    require 'http_redirect_test'

    class ExampleComTest < HTTPRedirectTest
      set_domain "example.com"

      def test_not_redirect
        should_not_redirect '/ok' # => Asserts 200 OK
      end

      def test_should_redirect_non_permanantly
        should_redirect '/redirect', to: '/ok' # => Asserts 300, 301, 302, 303
      end

      def should_redirect_permanently
        should_redirect '/redirect_permanant', to: '/ok', permanent: true # => Must be a 301 MOVED PERMANENTLY
      end

      def test_should_not_be_found
        should_not_be_found '/not_found' # => Asserts 404 NOT FOUND
      end

      def test_should_be_gone
        should_be_gone '/gone' # => Asserts 410 GONE
      end

      def test_custom_header
        should_have_header('/custom_header', 'X-One-Million-Years', with_value: 'Dungeon')
      end
    end

    class AllRedirectsArePermanent < HTTPRedirectTest
      set_domain "example.com"
      treat_all_redirects_as_permanent # => All redirects in this test must 301

      def test_should_redirect
        should_redirect '/redirect_permanant', to: '/ok'
      end

      def test_explicit_non_permanent_check_should_override
        should_redirect '/redirect', to: '/ok', permanent: false # => Must be redirect but not a 301
      end
    end

Thanks
------

Inspired by a blog post by Patrick Reagan of Viget Labs. http://viget.com/extend/test-drive-mod-rewrite-rules-with-testunit
