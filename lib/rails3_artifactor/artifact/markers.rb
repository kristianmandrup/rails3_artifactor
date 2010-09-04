require 'rails3_artifactor/base/class_methods'
require 'rails3_assist/base'

module Rails3::Assist::Artifact
  module Marker
    def marker name, type, options=nil
      method = "#{type}_marker"  
      raise "No such marker method in this context: #{self}, ##{method}" if !respond_to? method
      send method, name, options 
    end
  end
  
  module Controller
    def controller_marker name, options=nil
      "#{name.to_s.camelize}Controller < ActionController::Base"
    end
    
    extend self
  end

  module Helper   
    def helper_marker name, options=nil
      "#{name.to_s.camelize}Helper"
    end

    extend self
  end

  module Permit
    def permit_marker name, options=nil
      "#{name.to_s.camelize}"
    end        
    
    extend self    
  end
  
  module Mailer
    def mailer_marker name, options=nil
      "#{name.to_s.camelize}Mailer < ActionMailer::Base"
    end
    
    extend self    
  end    

  module Observer
    def observer_marker name, options=nil
      "#{name.to_s.camelize}Observer < ActiveRecord::Observer"
    end
    
    extend self
  end

  module Migration
    def migration_marker name, options=nil
      "#{name.to_s.camelize} < ActiveRecord::Migration"
    end    
    
    extend self
  end
  
  module Model   
    include Rails3::Assist::BaseHelper    
    
    def model_marker name, options={}
      return send :orm_marker_name, name, options if respond_to?(:orm_marker_name)
      name.to_s.camelize      
    end
    
    def orm_notify
      ". You must specify an ORM with the macro use_orm, f.ex -- use_orm :active_record"
    end 
    
    extend self       
  end
  
end
