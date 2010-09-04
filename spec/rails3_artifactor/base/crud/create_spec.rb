require 'spec_helper'

describe 'model without orm' do
  use_orm :none
  use_helper :model

  before :each do  
    Rails3::Assist::Directory.rails_root = fixtures_dir
  end

  after :each do              
    # remove_model :account
  end

  describe '#new_artifact_content' do
    it "should create artifact content" do
      content = new_artifact_content :person, :content => '# Hello', :type => :model
      content.should have_comment 'Hello'
    end
  end

  describe '#create_artifact' do
    it "should create artifact" do
      create_artifact :person, :type => :model do
        '# Hello'
      end
      
      has_model?(:person).should be_true
    end    
  end
end
