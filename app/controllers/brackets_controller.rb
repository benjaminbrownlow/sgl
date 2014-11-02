class BracketsController < ApplicationController

	def index
		@tournament = Tournament.find(params[:tournament_id])
		# @bracket = Bracket.where(tournament_id: => @tournament)
		# @activities = Activity.where(:tournament_id => @tournament)
		@bracket = Bracket.where(:tournament_id => @tournament)
	end

	def show
	end

end
