class GithubReposByUser
  include JsonResponse

  attr_reader :user

  def initialize(user)
    @user = user
    @link_header = response_headers("users/#{user.login}/repos?page=1")
  end

  def repos
    repositories = []
    repo_pages.to_i.times do |page|
      user_id = user_id_from_link_header
      GithubServiceRepoSearch.new(user, user_id, (page + 1)).run.map do |repo|
        repositories << Repository.new(repo)
      end
    end
    repositories
  end

  def repo_pages
    link_header.nil? ? 1 : link_header.split(",")[1].split(/page=/)[1][0]
  end

  def user_id_from_link_header
    @link_header.split(",")[0].split("/")[4] unless link_header.nil?
  end

  private

    attr_reader :link_header

end
