# -*- encoding: utf-8 -*-
# stub: responders 3.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "responders".freeze
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jos\u00E9 Valim".freeze]
  s.date = "2020-05-29"
  s.description = "A set of Rails responders to dry up your application".freeze
  s.email = "heartcombo@googlegroups.com".freeze
  s.homepage = "https://github.com/heartcombo/responders".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.4.13".freeze
  s.summary = "A set of Rails responders to dry up your application".freeze

  s.installed_by_version = "3.4.13" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<railties>.freeze, [">= 5.0"])
  s.add_runtime_dependency(%q<actionpack>.freeze, [">= 5.0"])
end