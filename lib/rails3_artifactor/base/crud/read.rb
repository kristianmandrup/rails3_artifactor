module Rails3::Assist::Artifact::CRUD
  module Read        
    
    # TODO: Support :before and :after hash options!
    def read_artifact(name, options, &block)
      type = get_type(options)
      file_name = existing_file_name(name, type)
      debug "reading from: #{file_name}"
      begin
        file = File.new(file_name)
        content = file.read
        debug "read content: #{content}"
        yield content if block
        content
      rescue
        raise "Rails #{type} at: #{file_name} can't be read"
      end
    end
  end
end