module Rails3::Assist::Artifact
  module View    
    module FileName
      DIR = Rails3::Assist::Artifact::Directory

      module Helper
        def default_template_lang 
          get_type :erb
        end

        def get_type type
          case type.to_s
          when 'erb'
            'html.erb'
          when 'haml'
            'html.haml'
          else
            type
          end
        end 

        def get_view_type type
          get_type(type.empty? ? default_template_lang : type)
        end          
        
        def filename_type str 
          str.split('.')[1..-1].join('.')
        end
        
        def filename_name str  
          str.gsub /\.(.*)/, ''
        end
      end

      def view_file_name *args
        folder, action, type = get_view_args(args)
        options = last_option args
        root_path = options[:root_path]
        views_path = options[:views_path]
        views_path ||= File.join(root_path, 'app/views') if root_path
        puts "views: #{views_path}"
        File.expand_path File.join(views_path || DIR.view_dir, folder.to_s, "#{action}.#{type}")
      end 
      
      def get_view_args *args
        args = args.flatten
        raise ArgumentError, "view_file_name must be called with one or more arguments to return a view file" if args.size == 0
        case args.size
        when 1        
          SingleArg.get_view_args *args
        else
          TwoArgs.get_view_args *args 
        end 
      end
    end 

    module SingleArg
      def self.get_view_args *args
        args = args.flatten
        arg = args.first
        case arg
        when Hash
          # view_file(:person => :show).should == /views\/person\/show\.html\.erb/          
          return HashArg.get_view_args arg if arg.keys.size == 1 
          # view_file(:folder => 'person', :type => :show).should == /views\/person\/show\.html\.erb/         
          HashArgs.get_view_args *args
        when Symbol, String 
          TwoArgs.get_view_args *args
        end        
      end
      
      module HashArg
        extend Rails3::Assist::Artifact::View::FileName::Helper
        
        # view_file(:person => :show).should == /views\/person\/show\.html\.erb/          
        def self.get_view_args one_hash 
          folder = one_hash.keys.first.to_s
          filename = one_hash.values.first.to_s
          action = filename_name filename
          type = get_view_type(filename_type filename)
          [folder, action, type]
        end
      end

      module HashArgs
        extend Rails3::Assist::Artifact::View::FileName::Helper

        DIR = Rails3::Assist::Artifact::Directory
        
        # view_file(:folder => 'person', :action => :show, :type => :erb).should == /views\/person\/show\.html\.erb/         
        def self.get_view_args hash
          try_folder = hash.keys.first
          try_view_folder = File.expand_path(File.join(DIR.view_dir, try_folder.to_s))
          if File.directory? try_view_folder
            folder = try_folder          
            action = hash.values.first
          else
            folder = hash[:folder]          
            action = hash[:action]
          end            
          type = get_view_type(hash[:type])
          [folder, action, type]
        end
      end

      module StringArg
        extend Rails3::Assist::Artifact::View::FileName::Helper

        # view_file('person/show').should == /views\/person\/show\.html\.erb/                         
        def self.get_view_args string 
          path_lvs = string.split('/')
          raise ArgumentError, "view must be in a subfolder #{args}" if path_lvs.size < 2
          folder = path_lvs[0..-2].join('/')
          filename = path_lvs.last
          action = filename_name filename
          type = get_view_type(filename_type filename)
          [folder, action, type]
        end
      end
    end

    module TwoArgs                
      def self.get_view_args *args
        args = args.flatten
        arg2 = args[1]
        res = case arg2
        when String, Symbol
          # view_file(:person, :show).should == /views\/person\/show\.html\.erb/
          # view_file('person/admin', :show, :type => :erb).should == /views\/person\/show\.html\.erb/
          TwoLabels.get_view_args args
        when Hash
          # view_file(:show, :folder => 'person', :type => :erb).should == /views\/person\/show\.html\.erb/
          ActionAndHash.get_view_args args
        end        
      end
      
      module TwoLabels
        extend Rails3::Assist::Artifact::View::FileName::Helper

        # view_file(:person, :show).should == /views\/person\/show\.html\.erb/
        # view_file('person/admin', :show, :type => :erb).should == /views\/person\/show\.html\.erb/
        def self.get_view_args *args
          args = args.flatten 
          folder = args.first.to_s
          action = args[1].to_s
          hash = args[2] if args.size > 2          
          type = get_view_type(hash ? hash[:type] : nil)
          [folder, action, type]
        end        
      end

      module ActionAndHash
        extend Rails3::Assist::Artifact::View::FileName::Helper
        
        # view_file(:show, :folder => 'person', :type => :erb).should == /views\/person\/show\.html\.erb/
        def self.get_view_args *args
          args = args.flatten 
          action = args.first.to_s

          hash = args.last
          folder = hash[:folder]
          type = get_view_type(hash[:type])
          
          [folder, action, type]
        end        
      end                
    end
    
    include FileName
    extend FileName
  end
end