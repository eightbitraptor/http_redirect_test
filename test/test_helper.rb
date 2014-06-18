require 'http_redirect_test'

require 'turn'
require 'minitest/autorun'
require 'mocha/mini_test'

Turn.config do |c|
  c.format = :pretty
end
