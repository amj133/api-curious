require 'rails_helper'

describe GithubServiceCommitsSearch do
  it "has a collection of raw commits" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    VCR.use_cassette("Github Service Commits Search") do
      search = GithubServiceCommitsSearch.new(user).run
      raw_commit = search[:items].first

      expect(search).to be_a(Hash)
      expect(search[:items]).to be_a(Array)

      expect(raw_commit).to be_a(Hash)
      expect(raw_commit[:url]).to be_a(String)
    end
  end
end
