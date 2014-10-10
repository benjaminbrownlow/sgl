class PagesController < ApplicationController
  
  def home
		 @tournament = Tournament.last

  end

  def tournaments
  end

  def dashboard
  	@players = Player.all

  	@tournaments = Tournament.all
  end
  
end
	