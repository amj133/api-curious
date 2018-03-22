class GithubServiceRepoSearch
  include JsonResponse

  def initialize(user)
    @user = user
  end

  def run
    json_response("users/#{user.login}/repos")
  end

  private

    attr_reader :user

end
