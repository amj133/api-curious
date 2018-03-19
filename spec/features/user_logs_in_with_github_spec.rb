require 'rails_helper'

describe "user logs in" do
  it "using github oauth" do
    omniauth_stub
    visit root_path

    expect(page).to have_link("Login with GitHub")

    click_on("Login with GitHub")

    expect(page).to have_content("Welcome amj133")
    expect(page).to have_link("logout")
  end

  def omniauth_stub
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] =
      OmniAuth::AuthHash.new({
                              "provider" => "github",
                              "uid" => 31484552,
                              "info" =>
                              {"email" => "amj@vt.edu", "urls" => {"GitHub" => "https://github.com/amj133"}},
                              "credentials" => {"token" => "bb9520046738fe2eb647a037ef5065cb6eebfd40", "expires" => false},
                              "extra" =>
                              {"raw_info" =>
                                   {"login" => "amj133",
                                    "id" => 31484552}}
                              })
  end
end
