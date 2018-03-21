class Repository
  attr_reader :name, :url

  def initialize(attrs = {})
    @name = attrs[:name]
    @url = attrs[:owner][:url]
  end

end
