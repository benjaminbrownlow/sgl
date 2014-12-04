class MatchesController < ApplicationController
	before_action :set_matches, except: [:show]
	
	def index
	end

	def show
		@match = Match.find(params[:id])
		@first = @match.player_ids.first
		@second = @match.player_ids.last
		@playerone = Player.find_by(id:@first)
		@playertwo = Player.find_by(id:@second)
		@tournament = @match.bracket.tournament
		@bracket = @match.bracket
	end

	def create
	end	

	def update
	end

	def set_winner
		
	end


	private
		def set_matches
			@bracket = Bracket.find(params[:bracket_id])
			@match = Match.where(bracket_id: @bracket)		
		end
end
