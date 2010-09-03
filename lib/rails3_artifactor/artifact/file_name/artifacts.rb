require 'migration_assist'
require 'rails3_artifactor/base/file_name'

module Rails3::Assist::Artifact
  (Rails3::Assist.artifacts - [:migration, :view]).each do |name|
    class_eval %{
      module #{name.to_s.camelize}
        module FileName
          include Rails3::Assist::Artifact::FileName
      
          def #{name}_file_name name, options=nil
            artifact_path name, :#{name}, options
          end        
        end

        extend FileName
        include FileName
      end
    }
  end
end  