require 'spec_helper'

CLASS = Rails3::Assist::Artifact::View

class ArtDir
  include CLASS
end

describe Rails3::Assist::Artifact::View::FileName do
  # use_orm :active_record

  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @test = ArtDir.new
  end

  describe '#view_file_name' do
    it "should return the file name for the persons/show view with default action" do      
      CLASS.view_file_name(:person).should match 'views/person/show'.to_regexp
    end

    it "should return the file name for the persons/show view with default type" do      
      CLASS.view_file_name(:person, :show).should match 'views/person/show'.to_regexp
    end

    it "should return the file name for the persons/show view with template type" do      
      CLASS.view_file_name(:person, :show, 'erb.hml').should match 'views/person/show'.to_regexp
    end

    it "should return the file name for the persons/show view using hash" do      
      CLASS.view_file_name(:person, :action => :show, :type => 'erb.hml').should match 'views/person/show'.to_regexp
    end

    it "should return the file name for the persons/show view with root path" do      
      CLASS.view_file_name(:person, :action => :show, :type => 'erb.hml', :root_path => Rails3::Assist::Directory.rails_root).should match 'views/person/show'.to_regexp
    end        
  end
end
