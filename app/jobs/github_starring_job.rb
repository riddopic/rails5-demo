class GithubStarringJob < ApplicationJob
  queue_as :default

  def perform(token)
    github_service = GitHubService.new(:access_token => token)
    result = github_service.star
  end
end
