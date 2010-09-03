require 'rails3_artifactor/rspec/macro'

RSpec.configure do |config|
  config.extend Rails3::Assist::UseMacro
  config.include Rails3::Assist::UseMacro
end