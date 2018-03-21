require 'rails_helper'

describe "user number of starred repos shown" do
  it "displays # of starred repos" do
    user = create(:user,
                  login: ENV['GITHUB_TEST_ENVIRONMENT_LOGIN'],
                  oauth_token: ENV['GITHUB_TEST_ENVIRONMENT_ACCESS_TOKEN'],
                  avatar_url: "https://avatars0.githubusercontent.com/u/31484552?v=4")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    expect(page).to have_content("Stars (2)")
  end
end
