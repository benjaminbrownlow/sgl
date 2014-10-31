class BracketsController < ApplicationController

	def index
		@tournament = Tournament.find(params[:tournament_id])
		@activities = Activity.where(:tournament_id => @tournament)
	end

	def show
	end

	def build_init
		
	end
end
