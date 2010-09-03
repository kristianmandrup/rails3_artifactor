module Rails3::Assist::CRUD
  module Update
    def insert_into_artifact name, options={}, &block
      type = get_type(options)
      file = existing_file_name(name, type)

      raise "No file could be determined: #{file} from name: #{name} of type: #{type}" if !file      
      raise "File to insert in not found: #{file} for #{type}" if !File.file?(file)

      options1 = options.merge marker_option(name, type, options)
      
      res = File.insert_into file, options, &block
      if !res
        # try with :embedded option if default doesn't work
        options.merge! marker_option(name, type, options.merge(:model_type => :embedded))

        File.insert_into file, options, &block        
      end
    end 
    alias_method :update_artifact, :insert_into_artifact
    
    def remove_from_artifact name, options={}, &block
      # TODO
    end

    def remove_content_from type, *names, replacement_expr=nil, &block
      names.flatten.each do |name|
        file = existing_file_name(name, type)
        File.remove_content_from file, replacement_expr=nil, &block
      end
    end  
    
    # TODO
    alias_methods_for :remove_content_from, :delete_content_from, :delete_from, :remove_from

    def replace_in_artifact name, options={}, &block
      # TODO
    end
  end
    
end