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
                
        multi_aliases_for :#{name}            
      end
    }
  end    
end
