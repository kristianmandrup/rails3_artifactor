require 'spec_helper'

describe 'controller' do
  use_helpers :controller

  before :each do
    Rails3::Assist::Directory.rails_root = fixtures_dir
    
    remove_controller :account if has_controller? :account        
    create_controller :account do
      %q{
        def index
        end
      }
    end    
  end

  after :each do              
    # remove_controller :account
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