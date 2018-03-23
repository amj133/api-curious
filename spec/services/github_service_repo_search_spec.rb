require 'rails_helper'

describe GithubServiceRepoSearch do
  it "has a collection of raw repo data" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")


    VCR.use_cassette("Github Service Repo Search")do
      search = GithubServiceRepoSearch.new(user, 1234).run
      raw_repo = search.first

      expect(search).to be_an(Array)
      expect(raw_repo).to be_a(Hash)

      expect(raw_repo).to have_key(:name)
      expect(raw_repo[:name]).to be_a(String)

      expect(raw_repo).to have_key(:owner)
      expect(raw_repo[:owner]).to be_a(Hash)

      expect(raw_repo[:owner]).to have_key(:url)
      expect(raw_repo[:owner][:url]).to be_a(String)
    end
  end
end
