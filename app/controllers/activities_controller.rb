class ActivitiesController < ApplicationController
	def create
		@activity = current_player.activities.build(:tournament_id => params[:tournament_id])
		if @activity.save
			redirect_to root_path, notice: 'Player Joined'
		else
			redirect_to root_path, notice: 'Error'
		end
	end	
end