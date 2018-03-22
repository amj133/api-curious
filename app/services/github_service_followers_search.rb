class GithubServiceFollowersSearch
  include JsonResponse

  def initialize(user)
    @user = user
  end

  def run
    json_response("/users/#{user.login}/followers")
  end

  private

    attr_reader :user

end
