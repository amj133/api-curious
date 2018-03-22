require 'rails_helper'

describe GithubFollowingByUser do
  describe "instance methods" do
    context "#following" do
      it "return array of following" do
        user = create(:user,
                      login: "monkey-man",
                      oauth_token: 12345,
                      avatar_url: "https://monkeys-rule.org")
        search = GithubFollowingByUser.new(user)

        get_stub("user_following", "users/#{user.login}/following")

        expect(search.following.count).to eq(3)
        expect(search.following.first).to be_a(Following)
        expect(search.following.first.username).to eq("mgmilton")
      end
    end
  end
end
