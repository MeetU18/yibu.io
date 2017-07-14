class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_raven_context, if: -> {Settings.raven.dsn}

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def set_raven_context
    Raven.user_context(id: current_user.id, name: current_user.username) if user_signed_in?
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
