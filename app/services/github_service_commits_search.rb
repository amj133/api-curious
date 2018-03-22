class GithubServiceCommitsSearch
  include JsonResponse

  def initialize(user)
    @user = user
    @date_limit = (Date.today - 14).strftime('%Y-%m-%d')
  end

  def run
    json_response("search/commits?q=author-date:>#{date_limit} author:#{user.login}", headers)
  end


  private

    attr_reader :user, :date_limit

    def headers
      {'Accept' => "application/vnd.github.cloak-preview+json"}
    end

end
