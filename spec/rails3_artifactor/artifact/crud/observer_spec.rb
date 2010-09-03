require 'spec_helper'

describe 'observer' do
  use_helpers :app, :observer

  before :each do              
    remove_observer :account        
    create_observer :account do
      %q{
        def index
        end
      }
    end    
  end

  after :each do              
    # remove_observer :account
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