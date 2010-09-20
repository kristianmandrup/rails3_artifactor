require 'migration_assist'
require 'sugar-high/regexp'

module Rails3::Assist::Artifact
  module Migration
    module FileName 
      include ::Rails3::Migration::Assist::ClassMethods      

      DIR = Rails3::Assist::Artifact::Directory

      class FindError
        attr_accessor :find_expr
      
        def initialize find_expr
          self.find_expr = find_expr
        end
      end
    
      def migration_file_name name, options={}
        number = options[:number]              
      
        migration_dir_name = File.expand_path(DIR.migration_dir options)
              
        number = next_migration_number(migration_dir_name) if !number      
        File.join(migration_dir_name, "#{number}_#{name}.rb")      
      end
          
      def find_migration name, options={}
        root_path = options[:root_path]        
           
        migration_dir_name = File.expand_path(DIR.migration_dir options)

        migration_find_expr = "#{migration_dir_name}/[0-9]*_*.rb"
        migrations = Dir.glob(migration_find_expr)
      
        find_err = FindError.new migration_find_expr
      
        return find_err if migrations.empty?  
      
        migration_find_expr = /\d+_#{name}\.rb$/
        find_err.find_expr = migration_find_expr
          
        matching_migrations = migrations.grep_it(migration_find_expr)

        return find_err if matching_migrations.empty?

        migration_file = (options[:last]) ? matching_migrations.last : matching_migrations.first
      end      
    end  

    include FileName 
    extend FileName     
  end
end