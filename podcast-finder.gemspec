# coding: utf-8
Gem::Specification.new do |spec|
  spec.name           = 'podcast-finder'
  spec.platform       = Gem::Platform::RUBY
  spec.version        = '10.1.0'
  spec.license        = 'MIT'

  spec.summary        = "CLI gem for finding NPR podcasts"
  spec.description    =
    "Podcast Finder is a CLI gem that displays ongoing podcasts by NPR and NPR-affiliated stations. Browse by category, view podcast descriptions and episodes, and get links to listen online."
  spec.authors        = ["Elyse Klova TEST"]
  spec.email          = 'corinna@flatironschool.com'

  spec.homepage       = 'https://github.com/klovae/podcast-finder-gem'

  spec.files          = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables    = ['podcast-finder']
  spec.require_paths  = ['lib']

  spec.post_install_message = "Thanks for installing! Happy listening."

  spec.add_runtime_dependency "nokogiri", ">= 0"
  spec.add_runtime_dependency "require_all"
  spec.add_runtime_dependency "colorize", "~> 0.8", ">= 0.8.1"
  spec.add_runtime_dependency "bundler"

  spec.add_development_dependency "rspec", "~>3.5"
  spec.add_development_dependency "pry", ">= 0"
end
