require 'spec_helper'

describe 'observer' do
  use_helpers :observer

  before :each do  
    Rails3::Assist::Directory.rails_root = fixtures_dir    
                
    remove_observer :account if has_observer? :account        
    create_observer :account do
      %q{
        def index
        end
      }
    end    
  end

  after :each do              
    remove_observer :account
  end

  context "Non-existant observer(s)" do
    it "should not fail trying to remove non-existant observers" do
      remove_observers :person, :user
      remove_artifacts :observer, :person, :user

      remove_observer :person
      remove_artifact :observer, :person
    end
  
    it "should not find a non-existant observer" do
      observer_file :person do |person|
        fail "should not find person observer!"
      end                                       
    
      has_observer?(:person).should be_false
      has_observers?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant observer" do
      insert_into_observer(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant observer" do
      read_observer :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end
    
  it "should have an account_observer file that contains an index method and two inserted comments" do
    insert_into_observer :account, :content => '# hello'
    insert_into_observer :account do
      '# goodbye'
    end
    read_observer(:account).should have_comment 'hello'
    puts read_observer(:account)

    # root_dir.should have_observer :account do |observer_file|
    #   observer_file.should have_method :index
    #   observer_file.should have_comment 'hello'
    #   observer_file.should have_comment 'goodbye'
    # end
  end
end