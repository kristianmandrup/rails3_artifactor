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
  end
end