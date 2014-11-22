class MatchesController < ApplicationController
	before_action :set_matches
	
	def index
	end

	def show
	end

	def create
		@total = @activities.count/2 #Find total number of players in tournament
		@players = Array.new # Prepare arrays for lists
		@gamer = Array.new

		@activities.each do |activity| # Add all players to array
			@players << activity.player_id
		end

		@total.times do
			@match = @bracket.matches.build # Take 2 players and create a match
				@gamers = @players.sample(2)
				@match.player_ids = @gamers
			@match.save
			@gamers.each do |gamer|
				@players.delete(gamer)
			end
		end
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
