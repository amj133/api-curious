require 'rails_helper'

describe GithubServiceStarredSearch do
  it "has collection of raw starred repos" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    VCR.use_cassette("Github Service Starred Search") do
      search = GithubServiceStarredSearch.new(user).run
      raw_starred = search.first

      expect(search).to be_a(Array)

      expect(raw_starred).to be_a(Hash)
      expect(raw_starred[:full_name]).to be_a(String)
    end
  end
end
