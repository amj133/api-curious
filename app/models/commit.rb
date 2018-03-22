class Commit
  attr_reader :repo_name, :date, :message

  def initialize(attrs = {})
    binding.pry
    @repo_name = attrs[:repository][:name]
    @date = attrs[:commit][:author][:date]
    @message = attrs[:commit][:message]
  end

end
