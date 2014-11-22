class Activity < ActiveRecord::Base
	before_save :activity_check

	belongs_to :player
	belongs_to :tournament


	def activity_check
		
	end


end
