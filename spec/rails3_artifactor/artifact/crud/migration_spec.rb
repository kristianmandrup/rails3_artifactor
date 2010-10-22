require 'spec_helper'
require 'generator-spec'

Rails3::Migration::Assist.orm = :active_record

describe 'migration' do 
  use_orm :active_record
  use_helpers :migration

  before :each do              
    @root_dir = Rails3::Assist::Directory.rails_root = fixtures_dir
    
    remove_migration :create_account if has_migration? :create_account
    
    create_migration :create_account do
      %q{
        def self.up
        end

        def self.down
        end
      }
    end    
  end

  after :each do              
    remove_migration :create_account
  end

  context "Migration not there" do
    it "should not fail trying to remove non-existant migrations" do
      remove_migrations :person, :user
      remove_artifacts :migration, :person, :user

      remove_migration :person
      remove_artifact :migration, :person
    end
  
    it "should not find a non-existant migration" do
      migration_file :person do |person|
        fail "should not find person migration!"
      end                                       
    
      has_migration?(:person).should be_false
      has_migrations?(:person, :user).should be_false
    end
     
    it "should not insert into non-existant migration" do
      insert_into_migration(:person, :after => 'Hello', :content => 'Yes').should_not be_true
    end
  
    it "should not read from non-existant migration" do
      read_migration :person do |content|
        fail "should not find person content!"
      end.should_not be_true
    end   
  end

  context "When migration does exist" do
    before do
      insert_into_migration :create_account, :content => '# hello'
      insert_into_migration :create_account do
        '# goodbye'
      end
    end
    
    it "should have an :create_account migration file that contains an index method and two inserted comments" do
      nil.should have_migration :create_account

      read_migration(:create_account).should have_comment 'hello'
      read_migration(:create_account).should match /ActiveRecord::Migration/
    end
    
    it "should not have migration blip" do
      lambda {existing_migration_file :blip}.should raise_error
    end
        
    it "shoud have migraion a :create_account migration with basic setup" do
      nil.should have_migration :create_account do |migration_file|
        migration_file.should have_class_method :up
        migration_file.should have_comment 'hello'
        migration_file.should have_comment 'goodbye'
      end
    end
  end
end