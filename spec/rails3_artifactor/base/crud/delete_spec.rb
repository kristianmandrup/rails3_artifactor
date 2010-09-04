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

  describe '#remove_artifact' do
    before :each do  
      create_artifact :person, :type => :model do
        '# Hello'
      end      
    end    
    
    it "should remove artifact" do
      has_model?(:person).should be_true
      remove_artifact :person, :type => :model
      has_model?(:person).should be_false
    end
  end

  describe '#remove_artifacts' do
    before :each do  
      create_artifact :person, :type => :model do
        '# Hello'
      end      
      create_artifact :user, :type => :model do
        '# Hi'
      end            
    end    

    it "should delete model artifacts :person and :user" do

      has_models?(:user, :person).should be_true

      remove_artifacts :person, :user, :type => :model

      has_models?(:person, :user).should be_false
    end    
  end
end

