# frozen_string_literal: true

require_relative '../lib/unary_factorial'
require 'minitest/autorun'
require 'minitest/pride'

class UnaryFactorialTest < Minitest::Test
  using UnaryFactorial.new

  def test_small_factorials
    assert_equal 1, !0
    assert_equal 1, !1
    assert_equal 2, !2
    assert_equal 6, !3
    assert_equal 24, !4
    assert_equal 120, !5
    assert_equal 3_628_800, !10
    assert_equal 2_432_902_008_176_640_000, !20
  end

  def test_larger_factorials
    assert_equal 30_414_093_201_713_378_043_612_608_166_064_768_844_377_641_568_960_512_000_000_000_000, !50
    assert_equal 8_320_987_112_741_390_144_276_341_183_223_364_380_754_172_606_361_245_952_449_277_696_409_600_000_000_000_000,
                 !60
  end

  def test_negatives_error
    assert_raises(UnaryFactorial::NegativeError) { !-1 }
    assert_raises(UnaryFactorial::NegativeError) { !-42 }
  end
end
