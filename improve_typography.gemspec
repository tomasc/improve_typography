# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'improve_typography/version'

Gem::Specification.new do |spec|
  spec.name          = 'improve_typography'
  spec.version       = ImproveTypography::VERSION
  spec.authors       = ['Tomas Celizna']
  spec.email         = ['tomas.celizna@gmail.com']

  spec.summary       = 'Improves typography (quotes, hyphens, etc.) of a given string. Works well with I18n.'
  spec.homepage      = 'https://github.com/tomasc/improve_typography'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'i18n'
  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
end
