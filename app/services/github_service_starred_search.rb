class GithubServiceStarredSearch
  include JsonResponse

  def initialize(user)
    @user = user
  end

  def run
    json_response("users/#{user.login}/starred")
  end

  private

    attr_reader :user

end
