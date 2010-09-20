require 'migration_assist'

Rails3::Migration::Assist.rails_root_dir = Rails3::Assist::Directory.rails_root

module Rails3::Assist::Artifact
  module Migration
    include Rails3::Assist::BaseHelper    
    include Rails3::Migration::Assist::ClassMethods
    include Rails3::Assist::Artifact::FileName
  end
end