class GithubUser
  attr_reader :uid, :login, :email, :url, :avatar_url, :name,
  :bio, :location

  def initialize(attrs)
    @uid = attrs["uid"]
    @login = attrs["extra"]["raw_info"]["login"]
    @email = attrs["info"]["email"]
    @url = attrs["info"]["urls"]["GitHub"]
    @avatar_url = attrs["extra"]["raw_info"]["avatar_url"]
    @name = attrs["extra"]["raw_info"]["name"]
    @bio = attrs["extra"]["raw_info"]["bio"]
    @location = attrs["extra"]["raw_info"]["location"]
  end

end
