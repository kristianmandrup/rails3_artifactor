# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails3_artifactor}
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kristian Mandrup"]
  s.date = %q{2010-12-18}
  s.description = %q{Helpers for handling Rails 3 artifacts in general, such as CRUD operations etc.}
  s.email = %q{kmandrup@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    ".document",
    ".rspec",
    "DESIGN_NOTES.markdown",
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION",
    "lib/rails3_artifactor.rb",
    "lib/rails3_artifactor/artifact.rb",
    "lib/rails3_artifactor/artifact/base.rb",
    "lib/rails3_artifactor/artifact/crud.rb",
    "lib/rails3_artifactor/artifact/crud/create.rb",
    "lib/rails3_artifactor/artifact/crud/delete.rb",
    "lib/rails3_artifactor/artifact/crud/read.rb",
    "lib/rails3_artifactor/artifact/crud/update.rb",
    "lib/rails3_artifactor/artifact/file_name/artifacts.rb",
    "lib/rails3_artifactor/artifact/file_name/migration.rb",
    "lib/rails3_artifactor/artifact/file_name/view.rb",
    "lib/rails3_artifactor/artifact/markers.rb",
    "lib/rails3_artifactor/artifact/migration.rb",
    "lib/rails3_artifactor/artifact/orm.rb",
    "lib/rails3_artifactor/artifact/orm/active_record.rb",
    "lib/rails3_artifactor/artifact/orm/data_mapper.rb",
    "lib/rails3_artifactor/artifact/orm/mongo_mapper.rb",
    "lib/rails3_artifactor/artifact/orm/mongoid.rb",
    "lib/rails3_artifactor/artifact/orm/none.rb",
    "lib/rails3_artifactor/artifact/view_artifact.rb",
    "lib/rails3_artifactor/base.rb",
    "lib/rails3_artifactor/base/crud.rb",
    "lib/rails3_artifactor/base/crud/create.rb",
    "lib/rails3_artifactor/base/crud/delete.rb",
    "lib/rails3_artifactor/base/crud/read.rb",
    "lib/rails3_artifactor/base/crud/update.rb",
    "lib/rails3_artifactor/base/file_name.rb",
    "lib/rails3_artifactor/macro.rb",
    "lib/rails3_artifactor/namespaces.rb",
    "lib/rails3_artifactor/rspec.rb",
    "lib/rails3_artifactor/rspec/configure.rb",
    "rails3_artifactor.gemspec",
    "spec/fixtures.rb",
    "spec/fixtures/app/views/account/edit.erb.html",
    "spec/fixtures/app/views/account/edit.html.erb",
    "spec/fixtures/app/views/layouts/application.erb.html",
    "spec/fixtures/app/views/layouts/application.html.erb",
    "spec/rails3_artifactor/artifact/base_spec.rb",
    "spec/rails3_artifactor/artifact/crud/controller_spec.rb",
    "spec/rails3_artifactor/artifact/crud/helper_spec.rb",
    "spec/rails3_artifactor/artifact/crud/mailer_spec.rb",
    "spec/rails3_artifactor/artifact/crud/migration_spec.rb",
    "spec/rails3_artifactor/artifact/crud/model_active_record_spec.rb",
    "spec/rails3_artifactor/artifact/crud/model_spec.rb",
    "spec/rails3_artifactor/artifact/crud/observer_spec.rb",
    "spec/rails3_artifactor/artifact/crud/permit_spec.rb",
    "spec/rails3_artifactor/artifact/crud/view_controller_action_spec.rb",
    "spec/rails3_artifactor/artifact/crud/view_file_spec.rb",
    "spec/rails3_artifactor/artifact/file_name/artifacts_spec.rb",
    "spec/rails3_artifactor/artifact/file_name/migration_spec.rb",
    "spec/rails3_artifactor/artifact/file_name/view_spec.rb",
    "spec/rails3_artifactor/artifact/markers_spec.rb",
    "spec/rails3_artifactor/artifact/migration_spec.rb",
    "spec/rails3_artifactor/artifact/orm/active_record_spec.rb",
    "spec/rails3_artifactor/artifact/orm/data_mapper_spec.rb",
    "spec/rails3_artifactor/artifact/orm/mongo_mapper_spec.rb",
    "spec/rails3_artifactor/artifact/orm/mongoid_spec.rb",
    "spec/rails3_artifactor/artifact/orm/none_spec.rb",
    "spec/rails3_artifactor/base/crud/create_spec.rb",
    "spec/rails3_artifactor/base/crud/delete_spec.rb",
    "spec/rails3_artifactor/base/crud/read_spec.rb",
    "spec/rails3_artifactor/base/crud/update_spec.rb",
    "spec/rails3_artifactor/base/file_name_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/kristianmandrup/rails3_artifactor}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Helpers for handling Rails 3 artifacts}
  s.test_files = [
    "spec/fixtures.rb",
    "spec/rails3_artifactor/artifact/base_spec.rb",
    "spec/rails3_artifactor/artifact/crud/controller_spec.rb",
    "spec/rails3_artifactor/artifact/crud/helper_spec.rb",
    "spec/rails3_artifactor/artifact/crud/mailer_spec.rb",
    "spec/rails3_artifactor/artifact/crud/migration_spec.rb",
    "spec/rails3_artifactor/artifact/crud/model_active_record_spec.rb",
    "spec/rails3_artifactor/artifact/crud/model_spec.rb",
    "spec/rails3_artifactor/artifact/crud/observer_spec.rb",
    "spec/rails3_artifactor/artifact/crud/permit_spec.rb",
    "spec/rails3_artifactor/artifact/crud/view_controller_action_spec.rb",
    "spec/rails3_artifactor/artifact/crud/view_file_spec.rb",
    "spec/rails3_artifactor/artifact/file_name/artifacts_spec.rb",
    "spec/rails3_artifactor/artifact/file_name/migration_spec.rb",
    "spec/rails3_artifactor/artifact/file_name/view_spec.rb",
    "spec/rails3_artifactor/artifact/markers_spec.rb",
    "spec/rails3_artifactor/artifact/migration_spec.rb",
    "spec/rails3_artifactor/artifact/orm/active_record_spec.rb",
    "spec/rails3_artifactor/artifact/orm/data_mapper_spec.rb",
    "spec/rails3_artifactor/artifact/orm/mongo_mapper_spec.rb",
    "spec/rails3_artifactor/artifact/orm/mongoid_spec.rb",
    "spec/rails3_artifactor/artifact/orm/none_spec.rb",
    "spec/rails3_artifactor/base/crud/create_spec.rb",
    "spec/rails3_artifactor/base/crud/delete_spec.rb",
    "spec/rails3_artifactor/base/crud/read_spec.rb",
    "spec/rails3_artifactor/base/crud/update_spec.rb",
    "spec/rails3_artifactor/base/file_name_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<generator-spec>, [">= 0.7.0"])
      s.add_runtime_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<require_all>, ["~> 1.2.0"])
      s.add_runtime_dependency(%q<sugar-high>, ["~> 0.3.0"])
      s.add_runtime_dependency(%q<rails3_assist>, ["~> 0.3.0"])
      s.add_runtime_dependency(%q<migration_assist>, ["~> 0.1.4"])
    else
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<generator-spec>, [">= 0.7.0"])
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<require_all>, ["~> 1.2.0"])
      s.add_dependency(%q<sugar-high>, ["~> 0.3.0"])
      s.add_dependency(%q<rails3_assist>, ["~> 0.3.0"])
      s.add_dependency(%q<migration_assist>, ["~> 0.1.4"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<generator-spec>, [">= 0.7.0"])
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<require_all>, ["~> 1.2.0"])
    s.add_dependency(%q<sugar-high>, ["~> 0.3.0"])
    s.add_dependency(%q<rails3_assist>, ["~> 0.3.0"])
    s.add_dependency(%q<migration_assist>, ["~> 0.1.4"])
  end
end

