require 'rails_helper'

describe GithubReposByUser do
  describe "instance methods" do
    context "#repos" do
      it "returns repos for a given user" do
        user = create(:user,
               login: "monkey-man",
               oauth_token: 12345,
               avatar_url: "https://monkeys-rule.org")

        # get_stub("user_repos_1_of_3", "users/#{user.login}/repos")
        get_stub("user_repos", "users/#{user.login}/repos?page=1")

        search = GithubReposByUser.new(user)

        expect(search.repos.count).to eq(30)
        expect(search.repos.first).to be_a(Repository)
      end

      xit "returns all repos if greater than 30" do
        user = create(:user,
               login: "monkey-man",
               oauth_token: 12345,
               avatar_url: "https://monkeys-rule.org")
        search = GithubReposByUser.new(user)

        get_stub("user_repos_1_of_3", "users/monkey-man/repos", {"link" => "<https://api.github.com/user/7215067/repos?page=2>; rel=\"next\", <https://api.github.com/user/7215067/repos?page=5>; rel=\"last\""})
        get_stub("user_repos_2_of_3", "users/7215067/repos?page=2")
        get_stub("user_repos_3_of_3", "users/7215067/repos?page=3")

        expect(search.repos.count).to eq(65)
        expect(search.repos.first).to be_a(Repository)
      end
    end
  end
end
