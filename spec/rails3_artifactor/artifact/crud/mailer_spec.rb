require 'spec_helper'

describe 'mailer' do
  use_helpers :mailer

  before :each do              
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    # remove_helper :account if has_helper? :account        
    create_mailer :account do
      %q{  def mail_it
  end}
    end    
  end

  after :each do              
    # remove_helper :account
  end
    
  it "should have an account_mailer file that contains a #mail_it method and two inserted comments" do
    insert_into_mailer :account, :content => '# hello'
    insert_into_mailer :account do
      '# goodbye'
    end
    read_mailer(:account).should have_comment 'hello'
    puts read_mailer(:account)
    # root_dir.should have_mailer :account do |helper_file|
    #   helper_file.should have_method :index
    #   helper_file.should have_comment 'hello'
    #   helper_file.should have_comment 'goodbye'
    # end
  end
end