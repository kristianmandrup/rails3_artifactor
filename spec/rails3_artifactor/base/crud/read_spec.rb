require 'spec_helper'

CONTENT = %q{
  # Hello
  # Intro
  # Goodbye
}

describe 'model without orm' do
  use_orm :none
  use_helper :model

  before :each do  
    Rails3::Assist::Directory.rails_root = fixtures_dir
  end

  after :each do              
    # remove_model :account
  end

  describe '#read_artifact' do
    before :each do  
      create_artifact :person, :type => :model do
        CONTENT
      end      
    end    

    after :each do              
      remove_model :person
    end
    
    it "should read artifact" do
      content = read_artifact :person, :type => :model
      content.should have_comment 'Hello'
    end
  end

  describe '#read_artifact :before' do
    before :each do  
      create_artifact :person, :type => :model do
        CONTENT
      end      
    end    

    after :each do              
      remove_model :person
    end

    it "should read before 'Hello'" do
      content = read_artifact :person, :type => :model, :before => 'Intro'
      content.should have_comment 'Hello'
      content.should_not have_comment 'Goodbye'
    end    
  end

  describe '#read_artifact :after' do
    before :each do  
      create_artifact :person, :type => :model do
        CONTENT
      end      
    end    

    after :each do              
      remove_model :person
    end

    it "should read after 'Hello' " do
      content = read_artifact :person, :type => :model, :after => 'Intro'
      content.should have_comment 'Goodbye'
      content.should_not have_comment 'Hello'
    end    
  end


end





