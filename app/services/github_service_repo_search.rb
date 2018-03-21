class GithubServiceRepoSearch

  def initialize(user)
    @user = user
  end

  def run
    json_response("users/#{user.login}/repos")
  end

  private

    attr_reader :user

    def conn
      Faraday.new(url: "https://api.github.com", headers: headers)
    end

    def headers
      {"access_token" => user.oauth_token}
    end

    def json_response(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end
