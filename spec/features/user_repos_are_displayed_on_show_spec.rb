require 'rails_helper'

describe "user repos displayed on show page" do
  it "displays users repos" do
    user = create(:user,
           login: "monkey-man",
           oauth_token: 12345,
           avatar_url: "https://monkeys-rule.org")

    json_response = File.open("./spec/fixtures/user_repos.json")
    stub_request(:get, "https://api.github.com/users/monkey-man/repos").with( headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v0.14.0',
      'access_token'=> 12345
       }).to_return(status: 200, body: json_response, headers: {})

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    within(".repo-grid") do
      expect(page).to have_content("black_thursday")
      expect(page).to have_content("dream_journal")
    end
  end
end
