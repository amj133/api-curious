class SessionsController < ApplicationController

  def create
    render text: request.env["omniauth.auth"].inspect
    binding.pry
  end

end
