class UsersController < ApplicationController

  def show
    @repos = GithubReposByUser.new(current_user).repos
    @followers = GithubFollowersByUser.new(current_user).followers
    @following = GithubFollowingByUser.new(current_user).following
    @starred = GithubStarredByUser.new(current_user).starred

    # @recent_commits = GithubService.new(current_user).find_recent_commits

    # gh = GithubService.new(current_user)
    # gh.find_followers
    # @followers_with_recent_commits = gh.find_followers_commits
  end

end
