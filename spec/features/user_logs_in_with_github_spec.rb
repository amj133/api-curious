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
          }
        )
end

describe "user logs in" do
  xit "using github oauth" do
    omniauth_stub
    visit root_path

    expect(page).to have_link("Login with GitHub")
    click_on("Login with GitHub")

    expect(page).to have_content("amj133")
    expect(page).to have_link("logout")
  end
end
