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
    plural_name = name.to_s.pluralize
    class_eval %{
      module #{name.to_s.camelize}
        include Rails3::Assist::BaseHelper
        
        def self.included base
          base.class_eval do              
            include Rails3::Assist::Artifact::CRUD        
          end
        end

        def has_#{plural_name}? *names
          names.to_strings.each do |name|
            return false if !has_#{name}? name
          end
          true
        end
        alias_method :#{plural_name}_files?, :has_#{plural_name}?

        def has_#{name}? name, &block
          begin
            found = existing_file_name(name, :#{name}).path.file?
          rescue IOError
            found = false
          end
          yield if block && found
          found
        end
        alias_method :has_#{name}_file?, :has_#{name}?
        alias_method :#{name}_file?, :has_#{name}?

        def #{name}_file name, &block
          found = existing_file_name(name, :#{name}).path
          yield found if block && found
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
    
        def remove_#{plural_name} *names      
          remove_artifacts :#{name}, *names
        end  
        
        def remove_all_#{plural_name}
          Rails3::Assist::Artifact::Files.#{name}_files.each do |file_name| 
            ::File.delete_file! file_name if ::File.file?(file_name)
          end
        end
        alias_method :delete_all_#{plural_name}, :remove_all_#{plural_name}           
    
        def remove_#{plural_name} *names
          return remove_all_#{plural_name} if names.empty? 
          names.to_strings.each do |name|
            file_name = #{name}_file(name)
            ::File.delete! file_name if ::File.file?(file_name)
          end
        end
        alias_method :delete_#{plural_name}, :remove_#{plural_name} 
        alias_method :remove_#{name}, :remove_#{plural_name} 
        alias_method :delete_#{name}, :remove_#{plural_name}                    
        
        multi_aliases_for :#{name}            
      end
    }
  end    
end
