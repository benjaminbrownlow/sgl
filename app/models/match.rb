class Match < ActiveRecord::Base
	belongs_to :bracket
	# has_many :players

	def self.init
		@tournament = Tournament.find(params[:tournament_id])
		@bracket = Bracket.find_by(:tournament_id => @tournament)
		@activities = Activity.where(:tournament_id => @tournament)

		# Find total number of players in tournament
		@total = @activities.count/2 
		@players = Array.new 
		@gamer = Array.new

		# Add all players to array
		@activities.each do |activity| 
			@players << activity.player_id
		end

		# Take 2 players and create a match
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
end
