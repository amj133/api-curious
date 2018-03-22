class Follower
  attr_reader :login

  def initialize(attrs)
    @login = attrs[:login]
  end

end
