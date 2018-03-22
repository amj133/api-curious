class GithubService

  def initialize(user)
    @user = user
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["access_token"] = user.oauth_token
      faraday.adapter Faraday.default_adapter
    end
    @date_limit = (Date.today - 14).strftime('%Y-%m-%d')
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # def find_repos
  #   response = get_url("https://api.github.com/users/#{@user.login}/repos")
  #   response.map do |raw_repo|
  #     Repository.new(raw_repo[:name])
  #   end
  # end
  #
  # def find_followers
  #   response = get_url("https://api.github.com/users/#{@user.login}/followers")
  #   @user_followers = response.map do |follower|
  #     Follower.new(follower[:login])
  #   end
  # end

  # def find_following
  #   response = get_url("https://api.github.com/users/#{@user.login}/following")
  #   response.map do |following|
  #     Following.new(following[:login])
  #   end
  # end

  # def find_starred
  #   response = get_url("https://api.github.com/users/#{@user.login}/starred")
  #   response.map do |starred|
  #     Starred.new(starred[:full_name])
  #   end
  # end

  def find_recent_commits(username = @user.login)
    response = @conn.get do |req|
      req.url "/search/commits?q=author-date:>#{@date_limit} author:#{username}"
      req.headers['Accept'] = "application/vnd.github.cloak-preview+json"
    end

    response = JSON.parse(response.body, symbolize_names: true)
    commits = []
    25.times do |i|
      commits << Commit.new(response[:items][i][:repository][:name], response[:items][i][:url])
    end
    commits
  end

  def find_followers_commits
    followers_and_commits = {}
    @user_followers.each do |follower|
      followers_and_commits[follower] = find_recent_commits(follower.username)
    end
    followers_and_commits
  end

  # https://api.github.com/search/commits/q=author-date:>2018-03-06 author:amj133
  # https://api.github.com/search/commits?q=author-date:>2018-03-12 author:amj133

end
