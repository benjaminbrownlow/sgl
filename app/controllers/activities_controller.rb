class ActivitiesController < ApplicationController

	def create
		@activity = current_player.activities.build(:tournament_id => params[:tournament_id])
		@tournament = Tournament.find(params[:tournament_id])
		if @activity.save
			redirect_to @tournament, notice: "You're signed up!"
		else
			redirect_to @tournament, notice: "Can't join this tournament."
		end
	end	

	def destroy
		@activity = current_player.activities.find(params[:id])
		@activity.destroy
		redirect_to dashboard_path, notice: "You backed out of the tournament."
	end
end