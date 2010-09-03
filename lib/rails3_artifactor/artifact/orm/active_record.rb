module Rails3::Assist::Orm
  module ActiveRecord
    include Rails3::Assist::Orm::Base

    def orm_marker_name options=nil
      'ActiveRecord::Base'
    end

    def new_model_content name, options={}, &block        
      content = options[:content] || yield if block
      file_w_inherit(name, orm_marker_name(options)) { content }
    end
  end
end