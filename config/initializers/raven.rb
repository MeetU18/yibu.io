if Settings.raven.dsn
  Raven.configure do |config|
    config.dsn = Settings.raven.dsn
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  end
end
