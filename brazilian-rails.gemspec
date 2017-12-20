require File.expand_path("./lib/brazilian-rails")

Gem::Specification.new do |gem|
  gem.name    = 'Brazilian Rails Giga'
  gem.version = GigaBrazilianRails::VERSION
  gem.date    = Date.today.to_s

  gem.summary = "Brazilian Rails"
  gem.description = "Test"

  gem.authors  = ['brazilian-rails team from https://github.com/tapajos/brazilian-rails']
  gem.email    = '113andre113@gmail.com'
  gem.homepage = 'https://github.com/Andre113/brazilian-rails'

  gem.add_dependency('rake')
  gem.add_development_dependency('rspec', [">= 2.0.0"])
  gem.add_dependency('brdinheiro')
  gem.add_dependency('brcep')
  gem.add_dependency('brdata')
  gem.add_dependency('brhelper')
  gem.add_dependency('brnumeros')
  gem.add_dependency('brstring')
  gem.add_dependency('brcpfcnpj')

  # ensure the gem is built out of versioned files
  gem.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*'] & `git ls-files -z`.split("\0")
end