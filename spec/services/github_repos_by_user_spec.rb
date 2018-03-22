require 'rails_helper'

describe GithubReposByUser do
  describe "instance methods" do
    context "#repos" do
      it "returns repos for a given user" do
        user = create(:user,
               login: "monkey-man",
               oauth_token: 12345,
               avatar_url: "https://monkeys-rule.org")
        search = GithubReposByUser.new(user)

        get_stub("user_repos", "users/#{user.login}/repos")

        expect(search.repos.count).to eq(30)
        expect(search.repos.first).to be_a(Repository)
      end
    end
  end
end
