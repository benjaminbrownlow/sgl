class MatchesController < ApplicationController
	before_action :set_matches, except: [:show, :player_win, :opponent_win]
	
	def index
	end

	def show
		# @match = Match.find(params[:id])
		# @first = @match.player_ids.first
		# @second = @match.player_ids.last
		# @playerone = Player.find_by(id:@first)
		# @playertwo = Player.find_by(id:@second)
		# @tournament = @match.bracket.tournament
		@match = Match.where(bracket_id:@bracket)
		# @bracket = @match.bracket
	end

	def create
	end	

	def update
	end

	def player_win
		@player = current_player
		@match = Match.find(params[:id])
		if @match.winner.nil?
			@match.winner = @player.evetag
			@match.save
			redirect_to root_path
		else
			@match.flag = true
			@match.save
			redirect_to root_path, notice: "The winner of this match has already been declared. If this is an error, please contact Sovereign Gaming League."
		end
	end

	def opponent_win
		@player = current_player
		@match = Match.find(params[:id])
		@players = @match.player_ids
		@players.each do |id|
			if id != @player.id
				@opponentId = id
			end
		end
		@opponent = Player.find_by(id: @opponentId).evetag
		if @match.winner.nil?
			@match.winner = @opponent
			@match.save
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
