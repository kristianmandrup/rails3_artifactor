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
      remove_views :edit, :show, :folder => :person
      remove_artifacts :view, :edit, :show, :folder => :person

      remove_view :person => :show
      remove_artifact :view, :show, :folder => :person
    end
  
    it "should not find a non-existant view" do
      view_file :show, :folder => :person do |person|
        fail "should not find person view!"
      end                                       
    
      has_view?(:show, :folder => :person).should be_false
      has_views?(:show, :edit, :folder => :person).should be_false
    end
     
    it "should not insert into non-existant view" do
      insert_into_view(:show, :folder => :person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant view" do
      read_view :person => :show do |content|
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
  end
end     

