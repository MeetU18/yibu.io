module AdminUtils
  module_function

  def admin_emails
    Settings.app.admin.emails.split(/\s+/)
  end
end