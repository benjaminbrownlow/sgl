class BracketsController < ApplicationController
	before_action :set_brackets

	def index
	end

	def show
		@match = Match.where(:bracket_id => @bracket)
	end

	

	
	private
		def set_brackets
			@tournament = Tournament.find(params[:tournament_id])
			@bracket = Bracket.find_by(:tournament_id => @tournament)
			@activities = Activity.where(:tournament_id => @tournament)
		end
end
