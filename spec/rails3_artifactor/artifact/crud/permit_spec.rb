require 'spec_helper'

describe 'permit' do
  use_helper :permit

  before :each do              
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    remove_permit :account if has_permit? :account        
    create_permit :account do
      %q{  licenses :fishing, :blogging}
    end    
    
    create_permit :super_admin, :superclass => :admin do
      %q{  licenses :admin_users}
    end  
    
    # puts read_permit :super_admin    
  end

  after :each do              
    remove_permit :account
    remove_permit :super_admin    
  end

  context "Non-existant permit(s)" do
    it "should not fail trying to remove non-existant permits" do
      remove_permits :person, :user
      remove_artifacts :permit, :person, :user

      remove_permit :person
      remove_artifact :permit, :person
    end
  
    it "should not find a non-existant permit" do
      permit_file :person do |person|
        fail "should not find person permit!"
      end                                       
    
      has_permit?(:person).should be_false
      has_permits?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant permit" do
      insert_into_permit(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant permit" do
      read_permit :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end
    
  it "should have an account_permit file that contains a #mail_it method and two inserted comments" do
    has_permit?(:account).should be_true
    has_permit?(:super_admin).should be_true    
    
    insert_into_permit :account, :content => '# hello'
    insert_into_permit :account do
      '# goodbye'
    end
    read_permit(:account).should have_comment 'hello'
    puts read_permit(:account)
    # root_dir.should have_permit :account do |permit_file|
    #   permit_file.should have_method :index
    #   permit_file.should have_comment 'hello'
    #   permit_file.should have_comment 'goodbye'
    # end
  end
end