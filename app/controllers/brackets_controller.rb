class BracketsController < ApplicationController
	before_action :set_brackets

	def index
	end

	def show
	end

	def matchinit
		# Tournament.id:38
		# Bracket.id: 5
		# @players = list of players [3,4,5,6,7,8]

		@total = @activities.count/2  # = 3

		@total.times do # Build Match 3 times
			@match = Match.create(:tournament_id => @tournament, :player_ids => [])
		end
	end

	private
		def set_brackets
			@tournament = Tournament.find(params[:tournament_id])
			@bracket = Bracket.find_by(:tournament_id => @tournament)
			@activities = Activity.where(:tournament_id => @tournament)
		end

end
