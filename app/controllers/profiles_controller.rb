class ProfilesController < ApplicationController
	
	def index
		@players = Player.all
	end

	def show
		# @player = player.find(params[:player])
  	# @activity = Activity.where(:player_id => @player)
	end
end