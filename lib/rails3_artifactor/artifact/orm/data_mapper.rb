module Rails3::Assist::Orm
  module DataMapper
    include Rails3::Assist::Orm::Base

    def orm_name
      'DataMapper'
    end

    def orm_marker_name name, options=nil
      "#{orm_name}::Resource"
    end

    def new_model_content name, options={}, &block        
      content = block ? yield : options[:content]
      file_w_include(name, orm_marker_name(name, options)) { content }
    end

    def field_name
      'property'
    end
  end
end