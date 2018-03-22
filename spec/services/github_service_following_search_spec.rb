require 'rails_helper'

describe GithubServiceFollowingSearch do
  it "has collection of raw following data for user" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    VCR.use_cassette("Github Service Following Search") do
      search = GithubServiceFollowingSearch.new(user).run
      raw_following = search.first

      expect(search).to be_a(Array)

      expect(raw_following).to be_a(Hash)
      expect(raw_following[:login]).to be_a(String)
    end
  end
end
