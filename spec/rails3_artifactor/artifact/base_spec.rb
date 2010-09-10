require 'spec_helper'

class Helper
  include Rails3::Assist::BaseHelper
end

describe 'BaseHelper' do
  describe '#marker_option' do

    it "should return marker option" do
      helper = Helper.new
      helper.stubs(:model_marker).returns 'Account'
      res = helper.send :marker_option, :account, :type => :model
      res[:after].should == 'Account'
    end
  end
end