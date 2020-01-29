require "minitest/autorun"

require_relative "cypher"

class TestCypher < Minitest::Test
  def setup
    @cypher = Cypher.new
  end

  def test_do_code_does_code
    assert_equal "code", @code_thing.do_code
  end
end