# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman3-sassc/version'

Gem::Specification.new do |spec|
  spec.name          = 'middleman3-sassc'
  spec.version       = Middleman3::SassC::VERSION
  spec.authors       = ['Brad Chen']
  spec.email         = ['brad.chen@70ms.com']
  spec.homepage      = 'https://github.com/70mainstreet/middleman3-sassc'

  spec.summary       = %q{Use SassC in Middleman 3.}
  spec.description   = %q{This gem lets you use SassC in Middleman 3. Note that Compass is not available.}
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'sassc', ['>= 1.7', '< 2']
  spec.add_runtime_dependency 'sassc-rails', ['>= 1.1', '< 2']
  spec.add_runtime_dependency 'middleman-core', ['>= 3.3.0', '< 4.0.0']
end