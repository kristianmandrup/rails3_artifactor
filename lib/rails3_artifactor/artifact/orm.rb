module Rails3::Assist
  module Orm
    module Base
      # include Rails3::Assist::Artifact::Model 

      protected

      def orm_marker_name name, options = {:model_type => :document}
        document_name options
      end

      def document_name options = {:model_type => :document} 
        type_content = options[:model_type] == :embedded ?  "#{orm_name}::EmbeddedDocument" : "#{orm_name}::Document"
      end

      def clazz name
        "class #{name.to_s.camelize}"
      end

      def file name, include_stmt, &block
        %Q{#{clazz name}
  #{include_stmt}
  #{yield if block}
end}
      end

      def file_w_include name, module_name, &block
        file name, "include #{module_name}", &block 
      end

      def simple_file name, module_name, &block
        %Q{#{clazz name}
  #{yield if block}
end}
      end

      def file_w_inherit name, module_name, &block
        %Q{#{clazz name} < #{module_name}
  #{yield if block}
end}
      end 
      
      def field name, type = nil
        return "#{field_name} :#{name}, #{type}" if type
        "#{field_name} :#{name}"
      end      
    end
  end
end
              
require_all File.dirname(__FILE__) + '/orm'