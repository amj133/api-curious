class Follower
  attr_reader :username

  def initialize(attrs)
    @username = attrs[:login]
  end

end
