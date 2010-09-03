require 'require_all'
require 'sugar-high/regexp'
require 'rails3_artifactor/namespaces'
require 'rails3_artifactor/artifact/markers'
# require 'rails3_artifactor/rspec/configure'

describe Rails3::Assist::Artifact::Controller do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Controller
  end

  describe '#controller_marker' do
    it "should return the class marker for controller :person" do      
      @clazz.controller_marker(:person).should == 'PersonController < ActionController::Base'
    end
  end
end

describe Rails3::Assist::Artifact::Helper do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Helper
  end

  describe '#helper_marker' do
    it "should return the class marker for helper :person" do      
      @clazz.helper_marker(:person).should == 'PersonHelper'
    end
  end
end

describe Rails3::Assist::Artifact::Permit do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Permit
  end

  describe '#permit_marker' do
    it "should return the class marker for permit :person" do      
      @clazz.permit_marker(:person).should == 'Person'
    end
  end
end

describe Rails3::Assist::Artifact::Mailer do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Mailer
  end

  describe '#mailer_marker' do
    it "should return the class marker for mailer :person" do      
      @clazz.mailer_marker(:person).should == 'PersonMailer < ActionMailer::Base'
    end
  end
end

describe Rails3::Assist::Artifact::Observer do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Observer
  end

  describe '#observer_marker' do
    it "should return the class marker for observer :person" do      
      @clazz.observer_marker(:person).should == 'PersonObserver < ActiveRecord::Observer'
    end
  end
end

describe Rails3::Assist::Artifact::Migration do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Migration
  end

  describe '#migration_marker' do
    it "should return the class marker for migration :create_person" do      
      @clazz.migration_marker(:create_person).should == 'CreatePerson < ActiveRecord::Migration'
    end
  end
end

describe Rails3::Assist::Artifact::Model do
  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @clazz = Rails3::Assist::Artifact::Model
  end

  describe '#model_marker' do
    it "should return the class marker for model :person" do      
      @clazz.model_marker(:person).should == 'Person'
    end
  end
end

