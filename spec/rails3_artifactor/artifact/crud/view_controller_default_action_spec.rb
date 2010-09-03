require 'spec_helper'

describe 'view' do
  use_helpers :app, :view

  before :each do              
    remove_view :account        
    create_view :account do
      %q{  def index
  end}
    end    
  end

  after :each do              
    # remove_view :account
  end
    
  it "should have an account_view file that contains an index method and two inserted comments" do
    insert_into_view :account, :content => '# hello', :before => 'def'
    insert_into_view :account, :before => 'def' do
      '# goodbye'
    end
    puts read_view(:account)
    read_view(:account).should have_comment 'hello'

    # root_dir.should have_view :account do |view_file|
    #   view_file.should have_method :index
    #   view_file.should have_comment 'hello'
    #   view_file.should have_comment 'goodbye'
    # end
  end
end