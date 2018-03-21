class UsersController < ApplicationController

  def show
    @repos = GithubService.new(current_user).find_repos
    @followers = GithubService.new(current_user).find_followers
    @following = GithubService.new(current_user).find_following
    @starred = GithubService.new(current_user).find_starred
    @recent_commits = GithubService.new(current_user).find_recent_commits
  end

end
