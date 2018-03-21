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

        json_response = File.open("./spec/fixtures/user_repos.json")
        stub_request(:get, "https://api.github.com/users/monkey-man/repos").with( headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.14.0',
          'access_token'=> 12345
           }).to_return(status: 200, body: json_response, headers: {})

        expect(search.repos.count).to eq(30)
        expect(search.repos.first).to be_a(Repository)
      end
    end
  end
end
