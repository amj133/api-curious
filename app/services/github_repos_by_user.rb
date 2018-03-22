class GithubReposByUser

  def initialize(user)
    @user = user
  end

  def repos
    GithubServiceRepoSearch.new(user).run.map do |repo|
      Repository.new(repo)
    end
  end

  private
  attr_reader :user

end
