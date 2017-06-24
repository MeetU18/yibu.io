RSpec.configure do |config|
  config.before :all do
    require 'sidekiq/testing'
    Sidekiq::Testing.fake! # fake is the default mode
  end
end
