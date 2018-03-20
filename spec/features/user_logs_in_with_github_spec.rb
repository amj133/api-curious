require 'rails_helper'

describe "user logs in" do
  xit "using github oauth process", :driver => :mechanize do
    visit root_path

    click_on("Login with GitHub")

    fill_in(:login, with: ENV["GITHUB_TEST_ENVIRONMENT_LOGIN"])
    fill_in(:password, with: ENV["GITHUB_TEST_ENVIRONMENT_PASSWORD"])
    save_and_open_page
    click_on("Sign in")

    click_button("authorize")

    expect(current_path).to eq(user_path(1))
  end

  it "using github oauth" do
    omniauth_stub
    visit root_path

    expect(page).to have_link("Login with GitHub")

    click_on("Login with GitHub")

    expect(page).to have_content("amj133")
    expect(page).to have_link("logout")
  end

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
          "credentials" => {"token" => "bb9520046738fe2eb647a037ef5065cb6eebfd40", "expires" => false},
          "extra" =>
            {"raw_info" =>
              {"login" => "amj133",
               "avatar_url" => "https://avatars0.githubusercontent.com/u/31484552?v=4",
               "id" => 31484552}}
        }
      )
  end
end
