require 'spec_helper'

describe 'mailer' do
  use_helpers :mailer

  before :each do              
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    remove_mailer :account if has_mailer? :account        
    create_mailer :account do
      %q{  def mail_it
  end}
    end    
  end

  after :each do              
    remove_mailer :account
  end

  context "Non-existant mailer(s)" do
    it "should not fail trying to remove non-existant mailers" do
      remove_mailers :person, :user
      remove_artifacts :mailer, :person, :user

      remove_mailer :person
      remove_artifact :mailer, :person
    end
  
    it "should not find a non-existant mailer" do
      mailer_file :person do |person|
        fail "should not find person mailer!"
      end                                       
    
      has_mailer?(:person).should be_false
      has_mailers?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant mailer" do
      insert_into_mailer(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant mailer" do
      read_mailer :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end
    
  it "should have an account_mailer file that contains a #mail_it method and two inserted comments" do
    insert_into_mailer :account, :content => '# hello'
    insert_into_mailer :account do
      '# goodbye'
    end
    read_mailer(:account).should have_comment 'hello'
    puts read_mailer(:account)
    # root_dir.should have_mailer :account do |mailer_file|
    #   mailer_file.should have_method :index
    #   mailer_file.should have_comment 'hello'
    #   mailer_file.should have_comment 'goodbye'
    # end
  end
end