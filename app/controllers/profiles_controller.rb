class ProfilesController < ApplicationController
	def show
		# @player = player.find(params[:player])
  	@activity = Activity.where(:player_id => @player)
	end
end