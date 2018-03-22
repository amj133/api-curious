class GithubCommitsByUser

  def initialize(user)
    @user = user
  end

  def commits
    GithubServiceCommitsSearch.new(user).run[:items].map do |commit|
      Commit.new(commit)
    end
  end

  private

    attr_reader :user

end
