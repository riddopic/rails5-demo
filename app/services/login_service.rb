class LoginService

  ##
  #
  # @param [String] token
  # @return [User]
  def login(code)
    result = Octokit.exchange_code_for_token(code, ENV['GITHUB_CLIENT_ID'], ENV['GITHUB_CLIENT_SECRET'])
    access_token = result[:access_token]
    if access_token
      github_service.access_token = access_token
      user = create_or_update_user(access_token)
      user
    else
      nil
    end
  end

  ##
  #
  # @return [String]
  def authorize_url
    github_service.authorize_url(ENV['GITHUB_CLIENT_ID'], 'public_repo')
  end

  protected

  ##
  # @return [GitHubService]
  def github_service
    @github_service ||= GitHubService.new
  end

  ##
  #
  # @return [User]
  def create_or_update_user(access_token)
    github_user = github_service.user
    user = User.find_or_create_by(username: github_user.login)
    user.update_attribute('access_token', access_token)
    user
  end

end