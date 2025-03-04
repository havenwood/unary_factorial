# frozen_string_literal: true

##
# This refinement uses the Schönhage–Strassen algorithm for efficient
# computation of factorials with results cached by default.
#
# Caching dramatically improves performance when portions of the
# factorial calculation are repeated.
class UnaryFactorial < Module
  class NegativeError < StandardError
    def initialize(message = 'Factorials cannot be negative') = super
  end

  attr_accessor :cache

  ##
  # If the `cache` keyword argument doesn't provide a custom cache,
  # a `Hash` will be used as the default cache. Set `cache` to `nil`
  # to disable caching.
  #
  # A custom `cache` must respond to `[]` and `[]=` and should also
  # respond to `size`, `clear` and `delete` as an accessor interface.
  def initialize(cache: {})
    @cache = cache

    module_eval do
      refine Integer do
        def !@
          raise NegativeError if negative?

          factorial(1..self)
        end

        private

        define_method :factorial do |range|
          if cache
            value = cache[range]
            return value if value
          end

          from = range.begin
          to = range.end
          diff = to - from

          value = case diff
          when 0
            from
          when ..3
            range.reduce(1, :*)
          else
            mid = (to + from) / 2
            factorial(from..mid) * factorial(mid.succ..to)
          end

          cache[range] = value if cache

          value
        end
      end
    end
  end
end
