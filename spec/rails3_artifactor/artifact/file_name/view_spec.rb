# require 'spec_helper'
require 'require_all'
require 'sugar-high/regexp'
require 'rails3_artifactor/namespaces'
require 'rails3_artifactor/artifact/file_name/view'
# require 'rails3_artifactor/rspec/configure'

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
    it "should return the file name for the persons/show view" do      
      CLASS.view_file_name(:person, :show).should match 'views/person/show'.to_regexp
    end
  end
end
