require 'test_helper'

class ResourcePathTest < Test::Unit::TestCase

  def test_that_resource_path_is_created_successfully
    rp = ResourcePath.new("")
    assert rp.instance_of? ResourcePath
  end
end
