require 'rails3_assist'
require 'sugar-high/module'

module Rails3
  module Assist
    module Artifact
      modules :crud
      modules Rails3::Assist.artifacts do
        nested_modules :file_name
      end
    end
  end
end