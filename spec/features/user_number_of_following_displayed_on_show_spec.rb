require 'rails_helper'

describe "user number of following display on show page" do
  it "displays # of users following" do
    user = create(:user,
           login: "monkey-man",
           oauth_token: 12345,
           avatar_url: "https://monkeys-rule.org")

    monkey_man_test_stubs

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Following (3)")
  end
end
