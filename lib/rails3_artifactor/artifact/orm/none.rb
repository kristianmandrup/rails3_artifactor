module Rails3::Assist::Orm
  module None
    include Rails3::Assist::Orm::Base

    def orm_marker_name options=nil
      @name
    end

    def new_model_content name, options={}, &block        
      content = options[:content] || yield if block
      @name = name
      simple_file(name, orm_marker_name(options)) { content }
    end
  end
end
