module Rails3::Assist::Artifact
  Rails3::Assist.artifacts.each do |name|
    plural_name = name.to_s.pluralize
    class_eval %{
      module #{name.to_s.camelize}         
        def replace_in_#{name} name, options={}, &block
          replace_in_artifact(name, set(options, :#{name}), &block)
        end 

        def replace_in_#{plural_name} *names, &block
          replace_in_artifacts *names, &block
        end
      
        def insert_into_#{name}(name, options={}, &block)
          begin
            insert_into_artifact(name, set(options, :#{name}), &block)      
            true
          rescue
            nil
          end
        end
      end
    }
  end
end