module Rails3::Assist::Orm
  module MongoMapper
    include Rails3::Assist::Orm::Base

    def orm_name
      'MongoMapper'
    end      
  
    def new_model_content name, options={}, &block        
      content = block ? yield : options[:content]
      file_w_include(name, orm_marker_name(name, options)) { content }
    end

    def field_name
      'key'
    end
  end
end