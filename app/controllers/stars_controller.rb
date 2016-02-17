class StarsController < ApplicationController
  include CurrentUser

  def create
    GithubStarringJob.perform_later(current_user.access_token)    
  end
end
