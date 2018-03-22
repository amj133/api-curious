class Repository
  attr_reader :name, :url

  def initialize(attrs = {}, starred = "no")
    @name = attrs[:name]
    @url = attrs[:owner][:url]
    @starred = starred
  end

  def starred?
    @starred
  end

end
