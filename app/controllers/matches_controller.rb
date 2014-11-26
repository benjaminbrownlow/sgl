class MatchesController < ApplicationController
	before_action :set_matches
	
	def index
	end

	def show
	end

	def create
	end	

	def update
	end


	private
		def set_matches
			@tournament = Tournament.find(params[:tournament_id])
			@bracket = Bracket.find_by(:tournament_id => @tournament)
			@activities = Activity.where(:tournament_id => @tournament)
		end
end
