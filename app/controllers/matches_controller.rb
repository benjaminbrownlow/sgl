class MatchesController < ApplicationController
	before_action :set_matches
	
	def index
	end

	def show
	end


	def create
		@total = @activities.count/2 
		@players = Array.new
		@gamer = Array.new

		@activities.each do |activity|
			@players << activity.player_id
		end

		@total.times do
			@match = @bracket.matches.build
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
