class GithubFollowersByUser

  def initialize(user)
    @user = user
  end

  def followers
    GithubServiceFollowersSearch.new(user).run.map do |follower|
      Follower.new(follower)
    end
  end

  private

    attr_reader :user

end
