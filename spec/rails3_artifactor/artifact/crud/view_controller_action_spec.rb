require 'spec_helper'

describe 'view API - symbols' do
  use_helpers :app, :view

  before :each do              
    remove_view :account, :edit
    create_view :account, :edit do
      %q{
        <h1><%= title %></h1>
      }
    end    
  end

  after :each do              
    # remove_view :account
  end
    
  it "should have an account_view file that contains an index method and two inserted comments" do
    insert_into_view :account, :edit, :content => '# hello', :before => '<h1>'
    insert_into_view :account, :edit, :before => '<h1>' do
      '# goodbye'
    end
    puts read_view(:account, :edit)
    read_view(:account, :edit).should have_comment 'hello'

    # root_dir.should have_view :account do |view_file|
    #   view_file.should have_method :index
    #   view_file.should have_comment 'hello'
    #   view_file.should have_comment 'goodbye'
    # end
  end
end     

# describe 'view API - hash' do
#   use_helpers :app, :view
# 
#   before :each do              
#     remove_view :account, :action => :edit
#     create_view :account, :action => :edit do
#       %q{
#         <h1><%= title %></h1>
#       }
#     end    
#   end
# 
#   after :each do              
#     # remove_view :account
#   end
#     
#   it "should have an account_view file that contains an index method and two inserted comments" do
#     insert_into_view :account, :action => :edit, :content => '# hello', :before => '<h1>'
#     insert_into_view :account, :action => :edit, :before => '<h1>' do
#       '# goodbye'
#     end
#     puts read_view(:account, :action => :edit)
#     read_view(:account, :action => :edit).should have_comment 'hello'
#     puts view_file_name(:account, :edit)
#     # root_dir.should have_view :account do |view_file|
#     #   view_file.should have_method :index
#     #   view_file.should have_comment 'hello'
#     #   view_file.should have_comment 'goodbye'
#     # end
#   end
# end
