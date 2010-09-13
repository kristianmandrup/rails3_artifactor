module Rails3::Assist
  module UseMacro
    def use_orm orm
      class_eval do
        begin
          include "Rails3::Assist::Orm::#{orm.to_s.camelize}".constantize
        rescue
          raise ArgumentError, "Unregistered ORM library: #{orm}"
        end
      end
    end
  
    def assist_with *types      
      types.each{|type| use_helper type}      
    end
    alias_method :load_helpers, :assist_with
    alias_method :use_helpers,  :assist_with

    def rails_assist type
      class_eval do
        begin
          module_name = "Rails3::Assist::#{type.to_s.camelize}"
          include module_name.constantize
          if [:files, :directory].include? type
            module_name = "Rails3::Assist::Artifact::#{type.to_s.camelize}"
            include module_name.constantize          
          end
        rescue
          raise ArgumentError, "Unregistered Rails3 assist library: #{type}, #{module_name}"
        end
      end
    end

    def artifact_assist type
      class_eval do
        begin
          module_name = "Rails3::Assist::Artifact::#{type.to_s.camelize}"
          include module_name.constantize
        rescue
          raise ArgumentError, "Unregistered Rails3 Artifact assist library: #{type}, #{module_name}"
        end
      end
    end
  
    def use_helper type
      return rails_assist(type) if [:file, :files, :directory].include?(type)        
      artifact_assist(type)
    end 
    alias_method :load_helper, :use_helper
  end                         
end