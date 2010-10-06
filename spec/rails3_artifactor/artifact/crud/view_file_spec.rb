require 'spec_helper'

describe 'view API - symbols' do
  use_helpers :view

  def simple_path_expr str
    /#{Regexp.escape(str)}/    
  end

  before :each do              
    Rails3::Assist::Directory.rails_root = fixtures_dir
  end

  it "should find view file using args" do
    simple_path = 'views/person/show.html.erb'
    admin_path = 'views/person/admin/show.html.erb'
    
    person_show = simple_path_expr(simple_path)
    person_admin_show = simple_path_expr(admin_path)
    
    view_file(:person => :show).should match person_show
    view_file(:person => 'show').should match person_show
    view_file('person/admin/' => 'show').should match person_admin_show
    # view_file(:person, :show).should match person_show
    # view_file('person/admin', :show).should match person_admin_show
    # view_file(:show, :folder => 'person').should match person_show
    # view_file(:folder => 'person', :type => :show).should match person_show
  end 
end    