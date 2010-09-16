module Rails3::Assist::Orm
  module Mongoid
    include Rails3::Assist::Orm::Base

    def orm_name
      'Mongoid'
    end

    def field_name
      'field'
    end

    def new_model_content name, options={}, &block        
      content = block ? yield : options[:content]
      file_w_include(name, orm_marker_name(name, options)) { content }
    end

    def field name, type = nil
      return "#{field_name} :#{name}, :type => #{type}" if type
      "#{field_name} :#{name}"
    end
  end
end