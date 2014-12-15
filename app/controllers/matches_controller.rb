class MatchesController < ApplicationController
	before_action :set_matches, except: [:show, :player_win, :opponent_win]
	
	def index
	end

	def show
		@match = Match.where(bracket_id:@bracket)
	end

	def create
	end	

	def update
	end

	def player_win
		@player = current_player
		@match = Match.find(params[:id])
		@players = @match.player_ids
		# Find opponent ID
		@players.each do |id|
			if id != @player.id
				@opponentId = id
			end
		end
		@opponent = Player.find_by(id: @opponentId)
		if @match.winner.nil?
			# Set match Winner
			@match.winner = @player.evetag
			@match.save
			# Set Winner Win
			@player.totalWins = @player.totalWins.next
			@player.save
			# Set Opponent Loss
			@opponent.totalLoss = @opponent.totalLoss.next
			@opponent.save
			redirect_to root_path
		else
			@match.flag = true
			@match.save
			redirect_to root_path, notice: "The winner of this match has already been declared. If this is an error, please contact SGL."
		end
	end

	def opponent_win
		@player = current_player
		@match = Match.find(params[:id])
		@players = @match.player_ids
		# Find opponent ID
		@players.each do |id|
			if id != @player.id
				@opponentId = id
			end
		end
		@opponent = Player.find_by(id: @opponentId)
		if @match.winner.nil?
			# Set match Winner
			@match.winner = @opponent.evetag
			@match.save

			# Set Match Winner Win
			@opponent.totalWins = @player.totalWins.next
			@opponent.save

			# Set Current Player Loss
			@player.totalLoss = @player.totalLoss.next
			@player.save

			redirect_to root_path
		else
			@match.flag = true
			@match.save
			redirect_to root_path, notice: "The winner of this match has already been declared. If this is an error, please contact Sovereign Gaming League."
		end
	end


	private
		def set_matches
			@bracket = Bracket.find(params[:bracket_id])
			@match = Match.where(bracket_id: @bracket)		
		end
end
