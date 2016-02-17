class WelcomeController < ApplicationController
  include CurrentUser

  def index
    unless current_user?
      redirect_to '/login'
      return
    end
    github_service = GitHubService.new(:access_token => current_user.access_token)
    @count = github_service.stargazers_count
    @user = github_service.user
    @starred = github_service.starred?
  end

end
