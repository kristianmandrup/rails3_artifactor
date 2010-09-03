module Rails3::Assist
  module BaseHelper
    module ClassMethods
      def multi_aliases_for name
        multi_alias :_after_ => name, :create => :new, :insert_into => [:inject_into, :update], :read => :X_content, :remove => :delete                    
      end
    end
  end
end