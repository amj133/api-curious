require 'rails_helper'

def omniauth_stub
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] =
    OmniAuth::AuthHash.new(
      {
        "provider" => "github",
        "uid" => 31484552,
        "info" =>
        {"email" => "amj@vt.edu", "urls" => {"GitHub" =>
          "https://github.com/amj133"}},
          "credentials" => {"token" => ENV["GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN"], "expires" => false},
          "extra" =>
          {"raw_info" =>
            {"login" => "amj133",
              "avatar_url" => "https://avatars0.githubusercontent.com/u/31484552?v=4",
              "id" => 31484552}}
      })
end

describe "user logs in" do
  it "using github oauth" do
    user = create(:user,
                  login: "monkey-man",
                  oauth_token: 12345,
                  avatar_url: "https://monkeys-rule.org")

    omniauth_stub
    monkey_man_test_stubs

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    click_on("Login with GitHub")

    expect(page).to have_content("monkey-man")
    expect(page).to have_link("logout")
  end
end
