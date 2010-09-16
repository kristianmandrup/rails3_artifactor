require 'spec_helper'

describe 'view API - symbols' do
  use_helpers :view

  before :each do              
    Rails3::Assist::Directory.rails_root = fixtures_dir

    remove_view :account, :edit if has_view? :account, :edit
    create_view :account, :edit do
      %q{
        <h1><%= title %></h1>
      }
    end    
  end

  after :each do              
    remove_view :account
  end

  context "Non-existant view(s)" do

    it "should not fail trying to remove non-existant views" do
      pending "TODO"

      remove_views :edit, :show, :folder => :person
      remove_artifacts :view, :edit, :show, :folder => :person

      remove_view :show, :folder => :person
      remove_artifact :view, :show, :folder => :person
    end
  
    it "should not find a non-existant view" do
      pending "TODO"

      view_file :show, :folder => :person do |person|
        fail "should not find person view!"
      end                                       
    
      has_view?(:show, :folder => :person).should be_false
      has_views?(:show, :folder => :person).should be_false
    end
     
    it "should not insert into non-existant view" do
      pending "TODO"

      insert_into_view(:show, :folder => :person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant view" do
      pending "TODO"

      read_view :show, :folder => :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
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
