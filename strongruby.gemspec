require File.expand_path('../lib/strong_ruby/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'strongruby'
  spec.version       = StrongRuby::VERSION

  spec.authors       = ['Rob Blanco']
  spec.email         = 'rb@n-ary.org'
  spec.summary       = 'Optional typing for Ruby'

  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/strongruby/strongruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^test/})
  spec.require_paths = ['lib']
end
