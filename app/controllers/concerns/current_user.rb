module CurrentUser
  extend ActiveSupport::Concern

  def current_user?
    current_user != nil
  end

  def current_user
    return nil unless session[:username]
    @current_user ||= User.find_by(username: session[:username])
  end

end