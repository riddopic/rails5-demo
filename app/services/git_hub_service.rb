class GitHubService

  def initialize(options={})
    @client = Octokit::Client.new(options)
  end

  def access_token=(access_token)
    @client.access_token = access_token
  end

  def user
    @client.user
  end

  def authorize_url(client_id, scope)
    @client.authorize_url(client_id, :scope => scope)
  end

  def stargazers_count
    @client.repo(ENV['GITHUB_REPO']).stargazers_count rescue 0
  end

  def star
    @client.star('kontena/kontena-loadbalancer')
  end

  def starred?
    @client.starred?('kontena/kontena-loadbalancer')
  end

end