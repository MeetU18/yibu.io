module SessionsHelper

  # set redirect_to in new session path
  def new_user_session_path_with_redirect_back *args, **options
    options[:redirect_to] ||= request.path
    new_user_session_path(*args, **options)
  end
end
