require 'rails_helper'

describe GithubCommitsByUser do
  describe "instance methods" do
    context "#commits" do
       it "returns array of commits" do
        user = create(:user,
                      login: "monkey-man",
                      oauth_token: 12345,
                      avatar_url: "https://monkeys-rule.org")
        date_limit = (Date.today - 14).strftime('%Y-%m-%d')

        search = GithubCommitsByUser.new(user)

        get_stub("user_recent_commits", "search/commits?q=author-date:>#{date_limit} author:#{user.login}")

        expect(search.commits.count).to eq(30)
        expect(search.commits.first).to be_a(Commit)
        expect(search.commits.first.repo_name).to eq("api-curious")
        end
      # end
    end
  end
end
