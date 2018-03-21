require 'rails_helper'

describe "displays users followers" do
  it "shows feed of followers recent commits" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    within(first(".followers-feed")) do
      expect(page).to have_content("lnchambers")
      expect(page).to have_css("followers-recent-commits")
      expect(page).to have_content("api-curious")
    end
  end
end
