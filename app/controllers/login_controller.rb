class LoginController < ApplicationController

  def index
    if params[:code].present?
      code = params[:code]

      user = LoginService.new.login(code)
      session[:username] = user.username
      redirect_to root_path
    else
      url = LoginService.new.authorize_url
      redirect_to url
    end
  end


end
