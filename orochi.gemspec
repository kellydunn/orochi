# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{orochi}
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kellydunn"]
  s.date = %q{2011-01-17}
  s.description = %q{A ruby gem that helps ActiveRecord-ize directions and route data}
  s.email = %q{defaultstring@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README",
    "README.textile"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README",
    "README.textile",
    "Rakefile",
    "VERSION",
    "lib/generators/orochi/orochi_generator.rb",
    "lib/generators/orochi/templates/migrations/migration.rb",
    "lib/generators/orochi/templates/models/leg.rb",
    "lib/generators/orochi/templates/models/route.rb",
    "lib/generators/orochi/templates/models/router.rb",
    "lib/generators/orochi/templates/models/step.rb",
    "lib/orochi.rb",
    "lib/orochi/acts_as_routeable.rb",
    "lib/orochi/railtie.rb",
    "lib/rails_templates/default_template.rb",
    "orochi-0.0.6.gem",
    "orochi.gemspec",
    "spec/gem/acts_as_routeable_spec.rb",
    "spec/helpers/core.rb",
    "spec/rake/migration_spec.rb",
    "spec/rake/rake_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kellydunn/orochi}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{An easy way to ActiveRecord-ize directions and route data}
  s.test_files = [
    "spec/gem/acts_as_routeable_spec.rb",
    "spec/helpers/core.rb",
    "spec/rake/migration_spec.rb",
    "spec/rake/rake_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<geokit>, [">= 0"])
      s.add_runtime_dependency(%q<geokit-rails>, [">= 0"])
      s.add_runtime_dependency(%q<nayutaya-googlemaps-polyline>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<geokit>, [">= 0"])
      s.add_dependency(%q<geokit-rails>, [">= 0"])
      s.add_dependency(%q<nayutaya-googlemaps-polyline>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<geokit>, [">= 0"])
    s.add_dependency(%q<geokit-rails>, [">= 0"])
    s.add_dependency(%q<nayutaya-googlemaps-polyline>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

