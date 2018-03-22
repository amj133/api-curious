require 'rails_helper'

describe "user's recent commits are displayed in feed" do
  xit "displays recent commits on show" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Contribution Activity - Recent Commits")
    within(first(".recent-commits")) do
      expect(page).to have_css(".commit-name")
      expect(page).to have_content("api-curious")
      expect(page).to have_css(".commit-url")
      expect(page).to have_content("https://api.github.com/repos/amj133/api-curious/commits/fe672c39acce021c05452ea9ad547c221a400193")
    end
  end
end
