require 'rails_helper'

RSpec.describe User, type: :model do
  let(:auth) {
    {
      "uid" => 15,
      "info" => { "email" => "monkeysrule@gmail.com", "urls" => {"GitHub" => "https://github.com/amj133"}},
      "credentials" => {"token" => "12345", "expires" => false},
      "extra" =>
        {"raw_info" =>
          {"login" => "monkeysrule",
           "avatar_url" => "https://monkeysrule.com",
           "id" => 31484552,
           "name" => "Monkey Man",
           "location" => "Denver, CO",
           "bio" => "My mother was a wildlife biologist and I love monkeys!"}}
    }
  }

  it "can be created from oauth hash" do
    user = User.from_omniauth(auth)

    expect(user.uid).to eq("15")
    expect(user.oauth_token).to eq("12345")
  end

  describe "class methods" do
    it "returns existing user if they already exist" do
      create(:user, uid: 123)
      auth = {"uid" => 123}

      user = User.from_omniauth(auth)

      expect(User.count).to eq(1)
      expect(user.uid).to eq("123")
    end
  end
end
