require 'sugar-high/arguments'

module Rails3::Assist::Artifact::CRUD
  module Update
    def insert_into_artifact name, options={}, &block
      type = get_type(options)
      file = existing_file_name(name, type)

      raise "No file could be determined: #{file} from name: #{name} of type: #{type}" if !file      
      raise "File to insert in not found: #{file} for #{type}" if !File.file?(file)
                               
      marker = marker_option(name, options) 
      
      blip = send :"#{type}_marker", name, options
      options1 = options.merge marker 
      
      res = File.insert_into file, options1, &block
      if !res
        # try with :embedded option if default doesn't work
        mrk_opt = marker_option name, options.merge(:model_type => :embedded)
        options.merge! mrk_opt

        File.insert_into file, options, &block        
      end
    end 
    alias_method :update_artifact, :insert_into_artifact
    
    def remove_from_artifact name, options={}, &block
      type = options[:type]
      file = existing_file_name(name, type)      
      File.remove_content_from file, options, &block
    end

    def remove_from_artifacts *names, &block
      options = last_option(names)
      type = options[:type]
      artifacts = names.flatten.select_labels
      
      artifacts.each do |name|
        file = existing_file_name(name, type)
        File.remove_content_from file, options, &block
      end
    end    
    alias_hash :remove_from_artifact => :delete_from_artifact, :pluralize => true

    def replace_in_artifact name, options={}, &block
      type = options[:type]
      file = existing_file_name(name, type)      
      File.replace_content_from file, options, &block      
    end
    
    def replace_in_artifacts *names, &block
      options = last_option(names)
      type = options[:type]
      artifacts = names.flatten.select_labels
      
      artifacts.each do |name|
        file = existing_file_name(name, type)
        File.replace_content_from file, options, &block
      end
    end      
    alias_hash :replace_in_artifact => :update_artifact, :pluralize => true    
  end    
end