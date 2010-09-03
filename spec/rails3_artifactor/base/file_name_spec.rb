require 'require_all'
require 'rails3_artifactor/namespaces'
require 'rails3_artifactor/base/file_name'

describe Rails3::Assist::Artifact::FileName do
  describe '#make_file_name' do
    it "should ..." do
      pending "todo"
    end
  end

  describe '#existing_file_name' do
    it "should ..." do
      pending "todo"
    end
    
    Rails3::Assist.artifacts.each do |name|
      it "should find existing file for #{name}" do
        pending
      end
    end
  end
end
