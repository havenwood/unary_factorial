# frozen_string_literal: true

require_relative '../lib/unary_factorial'
require 'minitest/autorun'
require 'minitest/pride'

class UnaryFactorialTest < Minitest::Test
  Factorial = UnaryFactorial.new
  using Factorial

  def test_cache_basics
    assert_respond_to Factorial, :cache
    assert_kind_of Hash, Factorial.cache
  end

  def test_cache_contents
    !120

    assert_equal Factorial.cache.size, 63
    assert_equal Factorial.cache.fetch(69..72), 24_690_960
  end
end
