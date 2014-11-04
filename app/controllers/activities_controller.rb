class ActivitiesController < ApplicationController
	# before_action :validate, only: [:create]

	def create
		@activity = current_player.activities.build(:tournament_id => params[:tournament_id])
		@tournament = Tournament.find(params[:tournament_id])
		if @activity.save
			redirect_to @tournament, notice: "You're signed up!"
		else
			redirect_to @tournament, notice: 'Error'
		end
	end	

	private
		def validate
			@tournament = Tournament.find(params[:tournament_id])
			@activity = Activity.where(:tournament_id => @tournament)
			@player = current_player
			if @activity.player = @player
				redirect_to @tournament, notice: "You're already in this tournament"
			end
		end


end