require 'rspec'
require 'rspec/autorun'
require 'rails3_artifactor'

RSpec.configure do |config|
  config.mock_with :mocha
end
