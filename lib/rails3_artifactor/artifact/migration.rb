require 'migration_assist'

Rails::Migration::Assist.rails_root_dir = Rails3::Assist::App.rails_root_dir

module Rails3::Assist::Artifact
  module Migration
    include Rails3::Assist::BaseHelper    
    include Rails::Migration::Assist::ClassMethods
  end
end