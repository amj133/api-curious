require 'rails_helper'

describe "user repos displayed on show page" do
  it "displays users repos" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("black_thursday")
    expect(page).to have_content("dream_journal")
    expect(page).to have_content("bike-share")
    expect(page).to have_content("rails-engine")
  end
end
