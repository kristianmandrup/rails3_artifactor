module Rails3::Assist::Artifact
  Rails3::Assist.artifacts.each do |name|
    plural_name = name.to_s.pluralize
    class_eval %{
      module #{name.to_s.camelize}
        def create_#{name} name, options={}, &block
          create_artifact(name, set(options, :#{name}), &block)
        end          
      end
    }
  end
end