require 'rails_helper'

describe "user repos displayed on show page" do
  it "displays users repos" do
    user = create(:user,
           login: "monkey-man",
           oauth_token: 12345,
           avatar_url: "https://monkeys-rule.org")

    # repo_uri = "users/monkey-man/repos"
    # get_stub("user_repos", repo_uri)
    #
    # follower_uri = "users/monkey-man/followers"
    # get_stub("user_followers", follower_uri)
    #
    # following_uri = "users/monkey-man/following"
    # get_stub("user_following", following_uri)
    #
    # starred_uri = "users/monkey-man/starred"
    # get_stub("user_starred", starred_uri)

    monkey_man_test_stubs

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    within(".repo-grid") do
      expect(page).to have_content("black_thursday")
      expect(page).to have_content("dream_journal")
    end
  end
end
