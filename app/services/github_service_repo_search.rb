class GithubServiceRepoSearch
  include JsonResponse

  def initialize(user, page = 1)
    @user = user
    @page = page
  end

  def run
    if page == 1
      json_response("users/#{user.login}/repos?page=#{page}")
    else
      json_response("user/#{user.uid}/repos?page=#{page}")
    end
  end

  private

    attr_reader :user, :page

end
