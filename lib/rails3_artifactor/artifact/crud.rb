require 'sugar-high/file'
require_all File.dirname(__FILE__) + '/crud'

module Rails3::Assist::Artifact
  (Rails3::Assist.artifacts - [:model]).each do |name|
    class_eval %{
      module #{name.to_s.camelize}
        def new_#{name}_content name, content=nil, &block
          new_artifact_content name, :type => :#{name}, :content => content, &block
        end
      end
    }
  end

  Rails3::Assist.artifacts.each do |name|
    class_eval %{
      module #{name.to_s.camelize}
        include Rails3::Assist::BaseHelper
        
        def self.included base
          base.class_eval do              
            include Rails3::Assist::Artifact::CRUD        
          end
        end

        def has_#{name.to_s.pluralize}? *names
          names.flatten.each do |name|
            return false if !has_#{name}? name
          end
          true
        end

        def has_#{name}? name, &block
          begin
            found = existing_file_name(name, :#{name}).path.file?
          rescue IOError
            found = false
          end
          yield if block && found
          found
        end
        
        def create_#{name} name, options={}, &block
          create_artifact(name, set(options, :#{name}), &block)
        end          
      
        def insert_into_#{name}(name, options={}, &block)
          insert_into_artifact(name, set(options, :#{name}), &block)      
        end
        
        def read_#{name}(name, options={}, &block)
          read_artifact(name, set(options, :#{name}), &block)      
        end

        def remove_#{name} name
          remove_artifact name, :#{name}
        end
    
        def remove_#{name}s *names      
          remove_artifacts :#{name}, *names
        end              
        
        multi_aliases_for :#{name}            
      end
    }
  end    
end
