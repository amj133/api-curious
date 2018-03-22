class GithubFollowersCommitsByUser

  def initialize(followers)
    @followers = followers
  end

  def followers_and_commits
    followers_and_commits = {}
    @followers.each do |follower|
      followers_and_commits[follower] = GithubCommitsByUser.new(follower).commits
    end
    followers_and_commits
  end

  private

    attr_reader :user

end
