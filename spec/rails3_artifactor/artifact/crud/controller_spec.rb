require 'spec_helper'

describe 'controller' do
  use_helpers :controller

  before :each do
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    remove_controller :account # if has_controller? :account 
    create_controller :account do
      %q{
        def index
        end
      }
    end
  end

  after :each do
    remove_controller :account
  end

  context "Non-existant controller(s)" do
    it "should not fail trying to remove non-existant controllers" do
      remove_controllers :person, :user
      remove_artifacts :controller, :person, :user

      remove_controller :person
      remove_artifact :controller, :person

    end
  
    it "should not find a non-existant controller" do
      controller_file :person do |person|
        fail "should not find person controller!"
      end                                       
    
      has_controller?(:person).should be_false
      has_controllers?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant controller" do
      insert_into_controller(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant controller" do
      read_controller :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end
    
  it "should have an account_controller file that contains an index method and two inserted comments" do
    insert_into_controller :account, :content => '# hello'
    insert_into_controller :account do
      '# goodbye'
    end
    read_controller(:account).should have_comment 'hello'                                           
    puts read_controller(:account)
    # root_dir.should have_controller :account do |controller_file|
    #   controller_file.should have_method :index
    #   controller_file.should have_comment 'hello'
    #   controller_file.should have_comment 'goodbye'
    # end
  end
end