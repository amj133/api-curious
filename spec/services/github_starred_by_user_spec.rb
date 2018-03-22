require 'rails_helper'

describe GithubStarredByUser do
  describe "instance methods" do
    context "#starred" do
      it "has collection of starred repos for a user" do
        user = create(:user,
                      login: "monkey-man",
                      oauth_token: 12345,
                      avatar_url: "https://monkeys-rule.org")
        search = GithubStarredByUser.new(user)

        json_response = File.open("./spec/fixtures/user_starred.json")
        stub_request(:get, "https://api.github.com/users/monkey-man/starred").with( headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0',
          'access_token'=> 12345
           }).to_return(status: 200, body: json_response, headers: {})

        expect(search.starred.count).to eq(2)
        expect(search.starred.first).to be_a(Repository)
        expect(search.starred.first.name).to eq("http_web_server")
      end
    end
  end

end
