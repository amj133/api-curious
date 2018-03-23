require 'rails_helper'

describe GithubFollowersCommitsByUser do
  describe "instance methods" do
    context "#followers_and_commits" do
      it "returns hash of followers and their commits" do
        user = create(:user,
                      login: "monkey-man",
                      oauth_token: 12345,
                      avatar_url: "https://monkeys-rule.org")
        billy = Follower.new({login: "billy"})
        followers = [billy]

        date_limit = (Date.today - 14).strftime('%Y-%m-%d')

        json_response = File.open("./spec/fixtures/user_recent_commits.json")
        stub_request(:get, "https://api.github.com/search/commits?q=author-date:>#{date_limit} author:billy")
          .to_return(status: 200, body: json_response)

        search = GithubFollowersCommitsByUser.new(followers)

        billys_commits = search.followers_and_commits[billy]

        expect(billys_commits.class).to eq(Array)
        expect(billys_commits.count).to eq(30)
      end
    end
  end
end

#
# json_response_1 = [billy, jane]
# stub_request(:get, "https://api.github.com/users/monkey-man/followers")
#   .to_return(status: 200, body: json_response_1)
#
# json_response_2 = [commit_1]
# stub_request(:get, "https://api.github.com/search/commits?q=author-date:>#{date_limit} author:billy")
#   .to_return(status: 200, body: json_response_2)
#
# json_response_3 = [commit_2, commit_3]
# stub_request(:get, "https://api.github.com/search/commits?q=author-date:>#{date_limit} author:jane")
#   .to_return(status: 200, body: json_response_3)
