module Rails3::Assist::Artifact::CRUD
  module Delete
    def remove_artifact name, type
      file = existing_file_name name, type
      debug "removed artifact: #{name}" if File.exist?(file) && FileUtils.rm_f(file) 
    end
    alias_method :delete_artifact, :remove_artifact

    def remove_artifacts type,*names
      names.flatten.each{|name| send :"remove_#{type}", name }
    end
    alias_method :delete_artifacts, :remove_artifacts    
  end
end