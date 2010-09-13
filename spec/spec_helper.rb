require 'rspec/core'
# require 'autotest/rspec2'
require 'rails3_artifactor'
require 'code-spec'
require 'fixtures'

RSpec.configure do |config|
  config.mock_with :mocha
end
