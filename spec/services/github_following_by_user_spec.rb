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

        json_response = File.open("./spec/fixtures/user_following.json")
        stub_request(:get, "https://api.github.com/users/monkey-man/following").with( headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0',
          'access_token'=> 12345
           }).to_return(status: 200, body: json_response, headers: {})

        expect(search.following.count).to eq(3)
        expect(search.following.first).to be_a(Following)
        expect(search.following.first.username).to eq("mgmilton")
      end
    end
  end
end
