require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
  config.log_level = :error

  config.run_all_when_everything_filtered = true

  Ohai::Config[:log_level] = :error
end
