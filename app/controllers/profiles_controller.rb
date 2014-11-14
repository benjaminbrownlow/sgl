class ProfilesController < ApplicationController
	
	def index
		@players = Player.all
	end

	def show

	end
end