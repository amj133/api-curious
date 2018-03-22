require 'rails_helper'

describe "user's recent commits are displayed in feed" do
  it "displays recent commits on show" do
    user = create(:user,
                  login: "monkey-man",
                  oauth_token: 12345,
                  avatar_url: "https://monkeys-rule.org")

    monkey_man_test_stubs

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Contribution Activity - Recent Commits")
    within(first(".recent-commits")) do
      expect(page).to have_css(".commit-repo-name")
      expect(page).to have_content("api-curious")
      expect(page).to have_css(".commit-date")
      expect(page).to have_content("2018-03-19")
      expect(page).to have_css(".commit-message")
      expect(page).to have_content("initial commit - project setup")
    end
  end
end
