require 'rails_helper'

describe GithubFollowersByUser do
  describe "instance methods" do
    context "#followers" do
      it "returns a collection of followers" do
        user = create(:user,
                      login: "monkey-man",
                      oauth_token: 12345,
                      avatar_url: "https://monkeys-rule.org")
        search = GithubFollowersByUser.new(user)

        get_stub("user_followers", "users/#{user.login}/followers")

        expect(search.followers.count).to eq(2)
        expect(search.followers.first).to be_a(Follower)
        expect(search.followers.first.username).to eq("mgmilton")
      end
    end
  end
end
