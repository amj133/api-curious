require 'rails_helper'

describe "users followers are displayed" do
  it "shows recent commits of followers" do
    user = create(:user,
                  login: "monkey-man",
                  oauth_token: 12345,
                  avatar_url: "https://monkeys-rule.org")

    monkey_man_test_stubs

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    within(".followers-feed") do
      expect(page).to have_content("mgmilton")
      expect(page).to have_css(".followers-recent-commits")
      expect(page).to have_content("api-curious")
    end
  end
end
