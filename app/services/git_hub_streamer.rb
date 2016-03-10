class GitHubStreamer

  def self.run
    github_service = GitHubService.new(:access_token => ENV['GITHUB_ACCESS_TOKEN'])
    stargazers_count = github_service.stargazers_count rescue 0    
    task = Concurrent::TimerTask.new(execution_interval: 10) do
      new_count = github_service.stargazers_count
      if new_count != stargazers_count
        ActionCable.server.broadcast "github", {type: 'stargazers_count', result: new_count}
        stargazers_count = new_count
      end
    end
    task.execute
  end
end