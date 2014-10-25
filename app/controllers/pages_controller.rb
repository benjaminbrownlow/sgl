class PagesController < ApplicationController
  
  def home
		 @tournament = Tournament.last
  end

  def dashboard
  	@player = current_player
    @tournaments = @player.tournaments  
  end
  
end
	