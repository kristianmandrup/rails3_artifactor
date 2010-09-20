begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "rails3_artifactor"
    gem.summary = %Q{Helpers for handling Rails 3 artifacts}
    gem.description = %Q{Helpers for handling Rails 3 artifacts in general, such as CRUD operations etc.}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/rails3_artifact_helper"
    gem.authors = ["Kristian Mandrup"]
    gem.add_development_dependency "rspec", "~> 2.0.0.beta.22"

    gem.add_dependency "rspec",             "~> 2.0.0.beta.22"
    gem.add_dependency "require_all",       "~> 1.1.0"
    gem.add_dependency "sugar-high",        "~> 0.2.10"
    gem.add_dependency 'rails3_assist',     "~> 0.2.9"
    gem.add_dependency 'migration_assist',  "~> 0.1.4"
    
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

