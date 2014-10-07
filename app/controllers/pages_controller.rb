class PagesController < ApplicationController
  
  def home
		 @tournaments = Tournament.all
  end

  def tournaments
  end

  def dashboard
  	@players = Player.all
  	@tournaments = Tournament.all
  end
  
end
