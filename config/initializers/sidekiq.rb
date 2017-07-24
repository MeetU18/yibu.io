Sidekiq.configure_server do |config|
  options = {url: Settings.sidekiq.redis_url}
  options[:size] = Settings.sidekiq.server.redis_size if Settings.sidekiq.server&.redis_size
  config.redis = options
end

Sidekiq.configure_client do |config|
  options = {url: Settings.sidekiq.redis_url}
  options[:size] = Settings.sidekiq.client.redis_size if Settings.sidekiq.server&.redis_size
  config.redis = options
end