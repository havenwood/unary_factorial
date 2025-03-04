# frozen_string_literal: true

require_relative '../lib/unary_factorial'
require 'benchmark/ips'

using UnaryFactorial.new

def bench(target)
  puts "Factorial of #{target}:"
  Benchmark.ips do
    it.report("Normal uncached #{target}") { (2..target).reduce(1, :*) }
    it.report("Unary cached #{target}") { !target }

    it.compare!
  end
end

bench(2_600)
