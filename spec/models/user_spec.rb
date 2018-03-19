require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created from oauth hash" do
    auth = {"provider" => "github",
            "uid" => 31484552,
            "info" =>
              {"email"=>"amj@vt.edu", "urls" => {"GitHub" => "https://github.com/amj133"}},
            "credentials" => {"token" => "bb9520046738fe2eb647a037ef5065cb6eebfd40", "expires" => false},
            "extra" =>
               {"raw_info" =>
                 {"login" => "amj133",
                  "id" => 31484552}}}

    user = User.from_omniauth(auth)

    expect(user.uid).to eq("31484552")
    expect(user.login).to eq("amj133")
    expect(user.email).to eq("amj@vt.edu")
    expect(user.oauth_token).to eq("bb9520046738fe2eb647a037ef5065cb6eebfd40")
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
