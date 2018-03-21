class UsersController < ApplicationController

  def show
    @repos = GithubReposByUser.new(current_user).repos
    
    # @repos = GithubService.new(current_user).find_repos
    @followers = GithubService.new(current_user).find_followers
    @following = GithubService.new(current_user).find_following
    @starred = GithubService.new(current_user).find_starred
    @recent_commits = GithubService.new(current_user).find_recent_commits
    # gh = GithubService.new(current_user)
    # gh.find_followers
    # @followers_with_recent_commits = gh.find_followers_commits
  end

end
