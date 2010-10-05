module Rails3::Assist::Artifact
  Rails3::Assist.artifacts.each do |name|
    plural_name = name.to_s.pluralize
    class_eval %{
      module #{name.to_s.camelize}
        def has_#{plural_name}? *names
          names.to_strings.each do |name|
            return false if !has_#{name}? name
          end
          true
        end
        alias_method :#{plural_name}_files?, :has_#{plural_name}?

        def has_#{name}? name, &block
          begin
            found = existing_file_name(name, :#{name}).path.file?
          rescue IOError
            found = false
          end
          yield if block && found
          found
        end
        alias_method :has_#{name}_file?, :has_#{name}?
        alias_method :#{name}_file?, :has_#{name}?


        def read_#{name}(name, options={}, &block)
          begin
            read_artifact(name, set(options, :#{name}), &block)
          rescue
            nil
          end
        end

        def #{name}_file name, &block
          begin
            found = existing_file_name(name, :#{name}).path
            yield found if block && found
            found
          rescue
            nil
          end
        end
      end
    }
  end
end
