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

	def start
		Match.init
	end


	private
		def set_matches
			@tournament = Tournament.find(params[:tournament_id])
			@bracket = Bracket.find_by(:tournament_id => @tournament)
			@activities = Activity.where(:tournament_id => @tournament)
		end
end


# Tournament: 2
# bracket: 2