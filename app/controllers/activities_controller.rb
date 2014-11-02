class ActivitiesController < ApplicationController
	def create
		@activity = current_player.activities.build(:tournament_id => params[:tournament_id])
		@tournament = Tournament.find(params[:tournament_id])
		if @activity.save
			redirect_to @tournament, notice: "You're signed up!"
		else
			redirect_to @tournament, notice: 'Error'
		end
	end	

 # 	def destroy
 #    @activity = current_player.activities.find(params[:id])
 #    @activity.destroy 
 #    redirect_to 'pages#dashboard', notice: "Removed from tournament"
 #  end
end