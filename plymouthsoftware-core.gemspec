# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "plymouth-software/core/version"
require "plymouth-software/core.rb"

Gem::Specification.new do |s|
  s.name        = "plymouthsoftware-core"
  s.version     = PlymouthSoftware::Core::VERSION
  s.authors     = ["Chris Blunt"]
  s.email       = ["email@plymouthsoftware.com"]
  s.homepage    = "http://plymouthsoftware.com/"
  s.summary     = %q{Plymouth Software Core App}
  s.description = %q{A lightweight, simple gem providing mixins for basic app core functionality (e.g. authentication, simple scaled price columns, etc.).}

  # s.rubyforge_project = "plymouthsoftware-core"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_development_dependency "activerecord", "~> 3.2"
  s.add_development_dependency "actionpack", "~> 3.2"

  # s.add_runtime_dependency "rest-client"
  # s.add_runtime_dependency "active_record", "~> 3.0.0"
  # s.add_runtime_dependency "actionpack", "~> 3.0.0"
end
