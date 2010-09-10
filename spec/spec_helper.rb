require 'rspec'
require 'rspec/autorun'
require 'rails3_artifactor'
require 'code-spec'
require 'fixtures'

RSpec.configure do |config|
  config.mock_with :mocha
end
