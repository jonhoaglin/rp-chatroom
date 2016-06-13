class PagesController < ApplicationController
  def home
    unless logged_in?
      redirect_to login_path
    else
      redirect_to universes_path
    end
  end

  def search
    @rooms = Room.tagged_with(params[:tags], :any => true)
  end
end
