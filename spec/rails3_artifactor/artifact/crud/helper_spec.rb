require 'spec_helper'

describe 'helper' do
  use_helpers :helper

  before :each do              
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    remove_helper :account
    create_helper :account do
      %q{
        def index
        end
      }
    end    
  end

  after :each do              
    remove_helper :account
  end

  context "Non-existant helper(s)" do
    it "should not fail trying to remove non-existant helpers" do
      remove_helpers :person, :user
      remove_artifacts :helper, :person, :user

      remove_helper :person
      remove_artifact :helper, :person
    end
  
    it "should not find a non-existant helper" do
      helper_file :person do |person|
        fail "should not find person helper!"
      end                                       
    
      has_helper?(:person).should be_false
      has_helpers?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant helper" do
      insert_into_helper(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant helper" do
      read_helper :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end
    
  it "should have an account_helper file that contains an index method and two inserted comments" do
    insert_into_helper :account, :content => '# hello'
    insert_into_helper :account do
      '# goodbye'
    end
    read_helper(:account).should have_comment 'hello'
    # puts read_helper(:account)
    # root_dir.should have_helper :account do |helper_file|
    #   helper_file.should have_method :index
    #   helper_file.should have_comment 'hello'
    #   helper_file.should have_comment 'goodbye'
    # end
  end
end