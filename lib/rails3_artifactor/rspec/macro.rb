module Rails3::Assist
  module UseMacro
    def assist_with *types
      types.each{|type| use_helper type}
    end
    alias_method :load_helpers, :assist_with
    alias_method :use_helpers,  :assist_with

    def use_helper type
      class_eval do
        begin
          include "Rails3::Assist::Artifact::#{type.to_s.camelize}".constantize
        rescue
          raise ArgumentError, "Unregistered Rails3 helper library: #{type}"
        end
      end
    end 
    alias_method :load_helper, :use_helper

    def use_orm orm
      class_eval do
        begin
          include "Rails3::Assist::Orm::#{orm.to_s.camelize}".constantize
        rescue
          raise ArgumentError, "Unregistered ORM library: #{orm}"
        end
      end
    end
  end
end