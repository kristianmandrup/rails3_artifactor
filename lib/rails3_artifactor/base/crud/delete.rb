require 'sugar-high/array'

require 'rails3_artifactor/artifact/file_name/view'

module Rails3::Assist::Artifact::CRUD
  module Delete
    class ViewHelper
      extend Rails3::Assist::Artifact::View::FileName
    end
    
    def remove_artifact name, *args
      file = ViewHelper.view_file_name(name, args)       
      return FileUtils.rm_f(file) if File.exist?(file) 
      
      type = args.first  
      type = type[:type] if type.kind_of? Hash
      begin
        file = existing_file_name name, type
        FileUtils.rm_f(file) 
        debug "removed artifact: #{name}"  
        true
      rescue
        debug "artifact to remove not found: #{name}"          
        nil
      end
    end
    alias_method :delete_artifact, :remove_artifact

    def remove_artifacts *names
      type = last_option(names)[:type]
      names.flatten.select_labels.each{|name| remove_artifact(name, type) }
    end
    alias_method :delete_artifacts, :remove_artifacts    
  end
end