# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'unary_factorial'
  s.version = '0.0.1'
  s.required_ruby_version = '>= 3.4'
  s.license = 'MIT'
  s.summary = 'A refinement for efficient divide-and-conquer factorial calculation with caching.'
  s.description = 'An Integer refinement gem for efficient binary-splitting factorial calculation with optional caching with a unary method interface.'
  s.authors = ['Shannon Skipper']
  s.email = ['shannonskipper@gmail.com']
  s.homepage = 'https://github.com/havenwood/unary_factorial'
  s.files = %w[gems.rb license.txt rakefile.rb readme.md] + Dir['{bench,lib,test}/**/*.rb']
  s.metadata['rubygems_mfa_required'] = 'true'
end
