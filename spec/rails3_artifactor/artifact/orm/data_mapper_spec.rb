require 'spec_helper'

describe 'model with DataMapper' do
  use_orm :data_mapper

  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
  end

  before :each do              
    remove_model :account        
    create_model :account do
      %q{def index
  end}
    end    
  end

  after :each do              
    # remove_model :account
  end
    
  it "should have an account_model file that contains an index method and two inserted comments" do
    insert_into_model :account, :content => '# hello'
    insert_into_model :account do
      '# goodbye'
    end                  
    puts read_model(:account)    
    read_model(:account).should have_comment 'hello'

    # root_dir.should have_model :account do |model_file|
    #   model_file.should have_method :index
    #   model_file.should have_comment 'hello'
    #   model_file.should have_comment 'goodbye'
    # end
  end
end 

