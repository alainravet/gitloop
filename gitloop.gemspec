# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gitloop/version"

Gem::Specification.new do |s|
  s.name        = "gitloop"
  s.version     = Gitloop::VERSION
  s.authors     = ["Alain Ravet"]
  s.email       = ["alainravet@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{easily merge and rebase flat git history}
  s.description = %q{easily merge and rebase flat git history}

  s.rubyforge_project = "gitloop"

  s.files        = Dir.glob("{bin,lib,doc}/**/*") + %w(LICENSE README.markdown Gemfile Gemfile.lock)
  s.test_files   = Dir.glob("{features}/**/*")

  s.executables = ["git-loop", "gitloop"]
  s.require_paths = ["lib"]

  s.add_dependency('methadone')

  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('rake','~> 0.9.2')
  s.add_development_dependency('guard-cucumber')
  s.add_development_dependency('ruby_gntp')   # for Growl notifications
end
