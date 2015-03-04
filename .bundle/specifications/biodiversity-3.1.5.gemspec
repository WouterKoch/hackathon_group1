# -*- encoding: utf-8 -*-
# stub: biodiversity 3.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "biodiversity"
  s.version = "3.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Dmitry Mozzherin"]
  s.date = "2014-08-07"
  s.description = "Tools for biodiversity informatics"
  s.email = "dmozzherin@gmail.com"
  s.executables = ["nnparse", "parserver"]
  s.files = ["bin/nnparse", "bin/parserver"]
  s.homepage = "https://github.com/GlobalNamesArchitecture/biodiversity"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.3"
  s.summary = "Parser of scientific names"

  s.installed_by_version = "2.4.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<treetop>, ["~> 1.5"])
      s.add_runtime_dependency(%q<parallel>, ["~> 1.2"])
      s.add_runtime_dependency(%q<unicode_utils>, ["~> 1.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.6"])
      s.add_development_dependency(%q<rake>, ["~> 10.3"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.13"])
      s.add_development_dependency(%q<rr>, ["~> 1.1"])
      s.add_development_dependency(%q<debugger>, ["~> 1.6"])
    else
      s.add_dependency(%q<treetop>, ["~> 1.5"])
      s.add_dependency(%q<parallel>, ["~> 1.2"])
      s.add_dependency(%q<unicode_utils>, ["~> 1.4"])
      s.add_dependency(%q<bundler>, ["~> 1.6"])
      s.add_dependency(%q<rake>, ["~> 10.3"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<webmock>, ["~> 1.13"])
      s.add_dependency(%q<rr>, ["~> 1.1"])
      s.add_dependency(%q<debugger>, ["~> 1.6"])
    end
  else
    s.add_dependency(%q<treetop>, ["~> 1.5"])
    s.add_dependency(%q<parallel>, ["~> 1.2"])
    s.add_dependency(%q<unicode_utils>, ["~> 1.4"])
    s.add_dependency(%q<bundler>, ["~> 1.6"])
    s.add_dependency(%q<rake>, ["~> 10.3"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<webmock>, ["~> 1.13"])
    s.add_dependency(%q<rr>, ["~> 1.1"])
    s.add_dependency(%q<debugger>, ["~> 1.6"])
  end
end
