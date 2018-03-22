require 'rails_helper'

describe GithubCommitsByUser do
  describe "instance methods" do
    context "#commits" do
       it "returns array of commits" do
         # user = create(:user,
         #               login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
         #               oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
         #               avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")
        user = create(:user,
                      login: "monkey-man",
                      oauth_token: 12345,
                      avatar_url: "https://monkeys-rule.org")
        date_limit = (Date.today - 14).strftime('%Y-%m-%d')
        # VCR.use_cassette("Github Commits By User") do

          search = GithubCommitsByUser.new(user)

          # json_response = File.open("./spec/fixtures/user_recent_commits.json")
          # stub_request(:get, "https://api.github.com/search/commits?q=author-date:>#{date_limit} author#{user.login}").with( headers: {
          #   'Accept'=>'application/vnd.github.cloak-preview+json',
          #   }).to_return(status: 200, body: json_response, headers: {})

          # get_stub("user_recent_commits", "search/commits?q=author-date:%3E#{date_limit}%20author:#{user.login}")

          expect(search.commits.count).to eq(157)
          expect(search.commits.first).to be_a(Commit)
          expect(search.commits.first.repo_name).to eq("api-curious")
        end
      # end
    end
  end
end
