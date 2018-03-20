class UsersController < ApplicationController

  def show
    conn = Faraday.new(:url => "https://api.github.com/users/#{current_user.login}/repos", headers: {"access_token" => current_user.oauth_token})
    response = conn.get
    @repos = JSON.parse(response.body).map do |raw_repo|
      # raw_repo['name']
      Repository.new(raw_repo['name'])
    end
  end

end

class Repository
  attr_reader :name

  def initialize(name)
    @name = name
  end

end
