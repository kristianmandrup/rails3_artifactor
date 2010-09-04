require 'sugar-high/file'

module Rails3::Assist::Artifact::CRUD
  module Read
    # TODO: Support :before and :after hash options!
    def read_artifact(name, options = {}, &block)
      type = get_type(options)
      file_name = existing_file_name(name, type)
      debug "reading from: #{file_name}"
      File.read_from file_name, options, &block
    end
  end
end