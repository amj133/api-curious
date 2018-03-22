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

        json_response = File.open("./spec/fixtures/user_followers.json")
        stub_request(:get, "https://api.github.com/users/monkey-man/followers").with( headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0',
          'access_token'=> 12345
           }).to_return(status: 200, body: json_response, headers: {})

        expect(search.followers.count).to eq(2)
        expect(search.followers.first).to be_a(Follower)
        expect(search.followers.first.username).to eq("mgmilton")
      end
    end
  end
end
