module Rails3::Assist::Artifact
  Rails3::Assist.artifacts.each do |name|
    plural_name = name.to_s.pluralize
    class_eval %{
      module #{name.to_s.camelize}         
        def remove_#{name} name
          remove_artifact name, :#{name}
        end
    
        def remove_#{plural_name} *names      
          remove_artifacts :#{name}, *names
        end  
        
        def remove_all_#{plural_name}
          Rails3::Assist::Artifact::Files.#{name}_files.each do |file_name| 
            ::File.delete_file! file_name if ::File.file?(file_name)
          end
        end
        alias_method :delete_all_#{plural_name}, :remove_all_#{plural_name}           
    
        def remove_#{plural_name} *names
          return remove_all_#{plural_name} if names.empty? 
          names.to_strings.each do |name|
            file_name = #{name}_file(name)
            ::File.delete!(file_name) if file_name && ::File.file?(file_name)
          end
        end
        alias_method :delete_#{plural_name}, :remove_#{plural_name} 
        alias_method :remove_#{name}, :remove_#{plural_name} 
        alias_method :delete_#{name}, :remove_#{plural_name}      
      end
    }
  end
end