class UsersController < ApplicationController

  def show
    @repos = GithubService.new(current_user).find_repos
    @followers = GithubService.new(current_user).find_followers
    @following = GithubService.new(current_user).find_following
    @starred = GithubService.new(current_user).find_starred
  end

end
