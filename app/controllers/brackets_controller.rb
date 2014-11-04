class BracketsController < ApplicationController

	def index
		@tournament = Tournament.find(params[:tournament_id])
		@bracket = Bracket.find_by(:tournament_id => @tournament)
		@activities = Activity.where(:tournament_id => @tournament)
	end

	def show
		@tournament = Tournament.find(params[:tournament_id])
		@bracket = Bracket.find_by(:tournament_id => @tournament)
		@activities = Activity.where(:tournament_id => @tournament)
	end

	def matchinit
		@tournament = Tournament.find(params[:tournament_id])
		@bracket = Bracket.find_by(:tournament_id => @tournament)
		@activities = Activity.where(:tournament_id => @tournament)

		@match = @bracket.matches.build(params[:match])

		@activities.each do activity
			
		end
		end
	end

end
