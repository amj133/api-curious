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

end
