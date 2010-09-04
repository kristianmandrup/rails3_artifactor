module Rails3::Assist::Artifact
  module View
    include Rails3::Assist::BaseHelper

    def has_view? name, *args, &block
      file_name = view_file_name(name, args)
      file_name.path.file?
    end
    
    # CREATE
    def create_view name, *args, &block
      file_name = view_file_name(name, args)      
      dir = File.dirname(file_name)
      FileUtils.mkdir_p dir if !File.directory?(dir)

      content = get_content(args) || yield if block
      
      # abort if no content given
      debug "Warning: Content must be passed in either as a :content hash or a block" if !content
      return nil if !content

      debug "Writing view file: #{file_name}"
      # write file content of view
      File.open(file_name, 'w') do |f|  
        f.puts content 
      end
    end  

    # READ
    def read_view(name, *args, &block)
      file_name = view_file_name(name, args)
      debug "reading from: #{file_name}"
      file = File.new(file_name)
      raise "The view file: #{file} could not be found" if !file
      begin
        content = file.read
        debug "read content: #{content}"
        yield content if block
        content
      rescue
        nil
      end
    end
    
    # UPDATE
    def insert_into_view(name, *args, &block)
      file_name = view_file_name(name, args)
      debug "file insertion (view): #{file_name}"
      options = last_option args
      raise ArgumentError, ":before or :after option must be specified for insertion" if !(options[:before] || options[:after])
      
      File.insert_into file_name, options, &block
    end

    # DELETE
    def remove_view name, action=nil, type=nil
      file = view_file_name(name, action, type)
      FileUtils.rm_f(file) if File.exist?(file)
    end

    def get_content args
      args = args.flatten
      case args.first
      when Hash
        args.first[:content]
      end
    end    

    multi_aliases_for :view 
  end
end