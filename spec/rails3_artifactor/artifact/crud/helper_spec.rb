require 'spec_helper'

describe 'helper' do
  use_helpers :app, :helper

  before :each do              
    remove_helper :account        
    create_helper :account do
      %q{
        def index
        end
      }
    end    
  end

  after :each do              
    # remove_helper :account
  end
    
  it "should have an account_helper file that contains an index method and two inserted comments" do
    insert_into_helper :account, :content => '# hello'
    insert_into_helper :account do
      '# goodbye'
    end
    read_helper(:account).should have_comment 'hello'
    puts read_helper(:account)
    # root_dir.should have_helper :account do |helper_file|
    #   helper_file.should have_method :index
    #   helper_file.should have_comment 'hello'
    #   helper_file.should have_comment 'goodbye'
    # end
  end
end