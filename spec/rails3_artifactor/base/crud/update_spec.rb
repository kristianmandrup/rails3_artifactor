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

  describe '#insert_into_artifact' do
    it "should insert_into_artifact" do
      insert_into_artifact :account, :type => :model do
        '# hi there'
      end

      insert_into_artifact :account, :type => :model, :content => '# hi there'
      
      content = read_artifact :account, :type => :model, :after => 'Account' 
      content.should have_comment 'hi there'      
    end
  end

  describe '#replace_from_artifact' do
    it "should replace content from artifact" do
      replace_in_artifact :account, :type => :model, :content => '# hi there', :with => '# howdy'

      content = read_artifact :account, :type => :model, :after => 'Account'       
      content.should have_comment 'howdy'            
    end    
  end

  describe '#update_artifacts' do
    it "should remove content from artifact" do
      update_artifacts :account, :type => :model, :content => 'howdy', :with => 'hi there'

      content = read_artifact :account, :type => :model, :after => 'Account'       
      content.should have_comment 'hi there'            
    end    
  end


  describe '#remove_from_artifact' do
    it "should remove content from artifact" do
      remove_from_artifact :account, :type => :model, :content => '# hi there'

      content = read_artifact :account, :type => :model, :after => 'Account'       
      content.should_not have_comment 'hi there'            
    end    
  end

  describe '#remove_from_artifacts' do
    it "should remove content from artifact" do
      insert_into_artifact :account, :type => :model do
        '# hi there'
      end

      remove_from_artifacts :account, :type => :model, :content => '# hi there'

      content = read_artifact :account, :type => :model, :after => 'Account'       
      content.should_not have_comment 'hi there'            
    end    
  end
  
end





