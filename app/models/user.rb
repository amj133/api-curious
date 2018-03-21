class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(uid: auth_info["uid"]).first_or_create do |new_user|
      new_user.uid = auth_info["uid"]
      new_user.login = auth_info["extra"]["raw_info"]["login"]
      new_user.email = auth_info["info"]["email"]
      new_user.oauth_token = auth_info["credentials"]["token"]
      new_user.avatar_url = auth_info["extra"]["raw_info"]["avatar_url"]
      new_user.name = auth_info["extra"]["raw_info"]["name"]
      new_user.bio = auth_info["extra"]["raw_info"]["bio"]
      new_user.location = auth_info["extra"]["raw_info"]["location"]
    end
  end
end
