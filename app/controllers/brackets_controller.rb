class BracketsController < ApplicationController
	before_action :set_brackets

	def index
		@brackets = Bracket.where(tournament_id: @tournament)
	end

	def show
		@match = Match.where(:bracket_id => @bracket)
	end
	
	private
		def set_brackets
			@bracket = Bracket.find_by(params[:bracket_id])
			@tournament = @bracket.tournament
			@activities = Activity.where(:tournament_id => @tournament)
		end
end
