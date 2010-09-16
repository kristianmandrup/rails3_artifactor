require 'spec_helper'

describe 'model without orm' do
  use_orm :active_record

  before :each do  
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    delete_model(:account) # if has_model? :account                
    create_model :account do
      %q{def index
  end}
    end    
  end

  after :each do              
    remove_model :account
  end

  context "Non-existant model(s)" do
    it "should not fail trying to remove non-existant models" do
      remove_models :person, :user
      remove_artifacts :model, :person, :user

      remove_model :person
      remove_artifact :model, :person
    end
  
    it "should not find a non-existant model" do
      model_file :person do |person|
        fail "should not find person model!"
      end                                       
    
      has_model?(:person).should be_false
      has_models?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant model" do
      insert_into_model(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant model" do
      read_model :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end

  it 'should have #index method in :account model' do
    read_model(:account).should have_method :index
  end
    
  it "should have an account_model file that contains an index method and two inserted comments" do
    insert_into_model :account, :content => '# hello'
    insert_into_model :account do
      '# goodbye'
    end
    puts read_model(:account)
    read_model(:account).should have_comment 'hello'

    # root_dir.should have_model :account do |model_file|
    #   model_file.should have_method :index
    #   model_file.should have_comment 'hello'
    #   model_file.should have_comment 'goodbye'
    # end
  end
end

