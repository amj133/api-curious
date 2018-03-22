class GithubStarredByUser

  def initialize(user)
    @user = user
  end

  def starred
    GithubServiceStarredSearch.new(user).run.map do |starred|
      Repository.new(starred, "yes")
    end
  end

  private

    attr_reader :user

end
