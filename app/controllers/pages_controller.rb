class PagesController < ApplicationController
  
  def home
		 @tournament = Tournament.last
  end

  def tournaments
  end

  def dashboard
  	@players = current_player
  	@tournaments = Tournament.all
  end
  
end
	