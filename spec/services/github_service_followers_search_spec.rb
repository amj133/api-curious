require 'rails_helper'

describe GithubServiceFollowersSearch do
  it "has a collection of raw follower data" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    VCR.use_cassette("Github Service Followers Search") do
      search = GithubServiceFollowersSearch.new(user).run
      raw_follower = search.first

      expect(search).to be_a(Array)

      expect(raw_follower).to be_a(Hash)
      expect(raw_follower[:login]).to be_a(String)
    end
  end
end
