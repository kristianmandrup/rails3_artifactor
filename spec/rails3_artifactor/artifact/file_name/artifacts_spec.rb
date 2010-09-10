require 'spec_helper'

CLASS = Rails3::Assist::Artifact::FileName

class ArtDir
  include CLASS
end

describe Rails3::Assist::Artifact::FileName do
  # use_helper :directories

  before do
    Rails3::Assist::Directory.rails_root = File.dirname (__FILE__)
    @test = ArtDir.new
  end

  (Rails3::Assist.artifacts - [:migration, :view]).each do |name|
    eval %{
      describe '##{name}_file_name' do
        it "should return the file name for #{name}" do
          clazz = Rails3::Assist::Artifact::#{name.to_s.camelize}
          clazz.#{name}_file_name('user').should match /user/
        end
      end
    }
  end
end