require 'rails_helper'

describe GithubReposByUser do
  describe "instance methods" do
    context "#repos" do
      it "returns repos for a given user" do
        user = create(:user,
               login: "monkey-man",
               oauth_token: 12345,
               avatar_url: "https://monkeys-rule.org")

        get_stub("user_repos", "users/#{user.login}/repos?page=1")

        search = GithubReposByUser.new(user)

        expect(search.repos.count).to eq(30)
        expect(search.repos.first).to be_a(Repository)
      end

      it "returns all repos if greater than 30" do
        user = create(:user,
               login: "monkey-man",
               oauth_token: 12345,
               avatar_url: "https://monkeys-rule.org")

        get_stub("user_repos_1_of_3", "users/#{user.login}/repos?page=1", {"link" => "<https://api.github.com/user/789/repos?page=2>; rel=\"next\", <https://api.github.com/user/789/repos?page=3>; rel=\"last\""})
        get_stub("user_repos_2_of_3", "user/789/repos?page=2")
        get_stub("user_repos_3_of_3", "user/789/repos?page=3")

        search = GithubReposByUser.new(user)

        expect(search.repos.count).to eq(66)
        expect(search.repos.first).to be_a(Repository)
      end
    end
  end
end
