module Rails3::Assist
  module BaseHelper
    module ClassMethods
      def aliases_for name
        multi_alias :after => name, :create => :new, :insert_into => [:inject_into, :update], :read => :X_content, :remove => :delete                    
      end
    end
  end
end