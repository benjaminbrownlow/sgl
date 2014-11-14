class ProfilesController < ApplicationController
	
	def index
		@players = Player.all
	end

	def show
		@player = Player.find(params[:id])
  	@activity = Activity.where(:player_id => @player)
	end
end