module Rails3::Assist::Artifact
  module View
    include Rails3::Assist::BaseHelper
    include Rails3::Assist::Artifact::CRUD

    def has_view? name, *args, &block
      file_name = view_file_name(name, args)
      file_name.path.file?
    end

    def has_views? *args, &block
      options = last_option args
      args.to_strings.each do |name|
        return false if !has_view? name, options
      end
      true
    end

    def view_file name, *args
      view_file_name(name, args)
    end
    
    # CREATE
    def create_view name, *args, &block
      file_name = view_file_name(name, args)      
      dir = File.dirname(file_name)
      FileUtils.mkdir_p dir if !File.directory?(dir)

      content = get_view_content(args) || yield if block
      
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
    def read_view name, *args, &block
      file_name = view_file_name(name, args)
      debug "reading from: #{file_name}"
      begin
        file = File.new(file_name)
        content = file.read
        debug "read content: #{content}"
        yield content if block
        content
      rescue
        nil
      end
    end
    
    # UPDATE
    def insert_into_view *args, &block
      begin
        file_name = view_file_name(args)
        debug "file insertion (view): #{file_name}"
        options = last_option args
        raise ArgumentError, ":before or :after option must be specified for insertion" if !(options[:before] || options[:after])
        File.insert_into file_name, options, &block
        true
      rescue
        nil
      end
    end

    # DELETE
    def remove_view name, *args
      file = view_file_name(name, args)
      FileUtils.rm_f(file) if File.exist?(file)
    end

    # remove_views :edit, :show, :folder => :person
    def remove_views *args
      options = last_option args
      raise ArgumentError, "Missing :folder option in the last argument which must be a Hash" if !options && !options[:folder]
      args.to_symbols.each{|name| remove_view name, options}      
    end

    def get_view_content args
      args = args.flatten
      case args.first
      when Hash
        args.first[:content]
      end
    end    

    multi_aliases_for :view 
  end
end