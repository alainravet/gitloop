# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gitloop/version"

Gem::Specification.new do |s|
  s.name        = "gitloop"
  s.version     = Gitloop::VERSION
  s.authors     = ["Alain Ravet"]
  s.email       = ["alainravet@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "gitloop"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = ["gitloop"]
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rake','~> 0.9.2')
  s.add_dependency('methadone')
end
