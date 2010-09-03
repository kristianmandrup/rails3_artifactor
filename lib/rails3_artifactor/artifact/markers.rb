module Rails3::Assist::Artifact
  module Controller
    def controller_marker name, options=nil
      "#{name.to_s.camelize}Controller < ActionController::Base"
    end
  end

  module Helper
    def helper_marker name, options=nil
      "#{name.to_s.camelize}Helper"
    end
  end

  module Permit
    def permit_marker name, options=nil
      "#{name.to_s.camelize}"
    end
  end
  
  module Mailer
    def mailer_marker name, options=nil
      "#{name.to_s.camelize} < ActionMailer::Base"
    end
  end    

  module Observer
    def observer_marker name, options=nil
      "#{name.to_s.camelize}Observer < ActiveRecord::Observer"
    end
  end

  module Migration
    def migration_marker name, options=nil
      "#{name.to_s.camelize} < ActiveRecord::Migration"
    end    
  end
  
  module Model   
    include Rails3::Assist::BaseHelper    
    
    def model_marker name, options={}
      return send :orm_marker_name, options if respond_to?(:orm_marker_name)
      name.camelize      
    end
    
    def orm_notify
      ". You must specify an ORM with the macro use_orm, f.ex -- use_orm :active_record"
    end    
  end
  
end
