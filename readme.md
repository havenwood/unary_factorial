# UnaryFactorial

This gem refines `Integer` to provide a unary-style interface.

```ruby
!42
#=> 1405006117752879898543142606244511569936384000000000
```

A binary-splitting algorithm is used for efficient factorial calculation.

Optional caching is enabled by default for much faster repeated calculations.

## Usage

```ruby
require 'unary_factorial'

Factorial = UnaryFactorial.new
using Factorial

!5
#=> 120

Factorial.cache
#=> {1..3 => 6, 4..5 => 20, 1..5 => 120}
```

## Optionally disable caching

To disable caching, provide a falsey `cache` keyword argument:

```ruby
require 'unary_factorial'

Factorial = UnaryFactorial.new(cache: nil)

!5
#=> 120

Factorial.cache
#=> nil
```

## Installation

Install the gem directly:
```sh
gem install unary_factorial
```

Or add the gem to your app's bundle:
```
bundle add unary_factorial
bundle
```
