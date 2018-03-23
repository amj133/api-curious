class UsersController < ApplicationController

  def show
    @repos = GithubReposByUser.new(current_user).repos
    @followers = GithubFollowersByUser.new(current_user).followers
    @following = GithubFollowingByUser.new(current_user).following
    @starred = GithubStarredByUser.new(current_user).starred
    @recent_commits = GithubCommitsByUser.new(current_user).commits
    @followers_and_commits = GithubFollowersCommitsByUser.new(@followers).followers_and_commits
  end

end
