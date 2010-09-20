require 'rspec/core'
require 'rails3_artifactor/macro'

RSpec.configure do |config|
  config.extend   Rails3::Assist::UseMacro
  config.include  Rails3::Assist::UseMacro
end