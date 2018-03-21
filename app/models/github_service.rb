class GithubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["access_token"] = user.oauth_token
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def find_repos
    response = get_url("https://api.github.com/users/#{@user.login}/repos")
    response.map do |raw_repo|
      Repository.new(raw_repo[:name])
    end
  end

  def find_followers
    response = get_url("https://api.github.com/users/#{@user.login}/followers")
    response.map do |follower|
      Follower.new(follower[:login])
    end
  end

  def find_following
    response = get_url("https://api.github.com/users/#{@user.login}/following")
    response.map do |following|
      Following.new(following[:login])
    end
  end

  def find_starred
    response = get_url("https://api.github.com/users/#{@user.login}/starred")
    response.map do |starred|
      Starred.new(starred[:full_name])
    end
  end

  def find_recent_commits
    date = (Date.today - 14).strftime('%Y-%m-%d')

    response = @conn.get do |req|
      req.url "/search/commits?q=author-date:>#{date} author:#{@user.login}"
      req.headers['Accept'] = "application/vnd.github.cloak-preview+json"
    end

    response = JSON.parse(response.body, symbolize_names: true)
    commits = []
    25.times do |i|
      commits << Commit.new(response[:items][i][:repository][:name], response[:items][i][:url])
    end
    commits
  end

  # https://api.github.com/search/commits/q=author-date:>2018-03-06 author:amj133
  # https://api.github.com/search/commits?q=author-date:>2018-03-12 author:amj133

end
