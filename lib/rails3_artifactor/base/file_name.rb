require 'rails3_assist/artifact'

module Rails3::Assist::Artifact
  module FileName         
    include Rails3::Assist::Artifact::Directory
    include Rails3::Assist::Artifact::Path

    def make_file_name name, type, options={}      
      send :"#{type}_file_name", name, options
    end

    def existing_file_name name, type=nil 
      # first try finder method
      finder_method = :"find_#{type}"       
      if respond_to?(finder_method)          
        result = send finder_method, name 
        if !result.kind_of? String          
          raise "The call to #find_#{type}(#{name}) didn't find an existing #{type} file. Error in find expression: #{result.find_expr}" 
        end
        return result
      elsif type == :migration
        raise "The method #find_#{type} to find the migration is not available!"
      end
      
      # default for non-migration
      file_name = make_file_name(name, type)      
      raise "No file for ##{type} found at location: #{file_name}" if !File.file?(file_name)
    end

    Rails3::Assist.artifacts.each do |name|
      class_eval %{
        def existing_#{name}_file name, type=nil
          existing_file_name name, type
        end
      } 
    end
  end  # file_name
  
  include FileName
end    
