require 'rails_helper'

describe "user logs in" do
  it "using github oauth" do
    visit root_path

    expect(page).to have_link("Login with GitHub")

    click_on("Login with GitHub")
    omniauth_stub

    expect(page).to have_content("Welcome Andrew Jeffery")
    expect(page).to have_link("Logout")
  end

  def omniauth_stub
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:github] =
      OmniAuth::AuthHash.new({
                              # empty for now
                              })
  end
end
