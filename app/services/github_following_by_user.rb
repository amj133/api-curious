class GithubFollowingByUser

  def initialize(user)
    @user = user
  end

  def following
    GithubServiceFollowingSearch.new(user).run.map do |following|
      Following.new(following)
    end
  end

  private

    attr_reader :user

end
