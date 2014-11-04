class PagesController < ApplicationController
  
  def home
		 @tournament = Tournament.last
  end

  def dashboard
  	@player = current_player
  	@activity = Activity.where(:player_id => @player)
  end
  
end
	