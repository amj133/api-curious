class GithubServiceRepoSearch
  include JsonResponse

  def initialize(user, user_id, page = 1)
    @user = user
    @user_id = user_id
    @page = page
  end

  def run
    page > 1 ? path = user_id : path = user.login 
    json_response("users/#{path}/repos?page=#{page}")
  end

  private

    attr_reader :user, :page

end
