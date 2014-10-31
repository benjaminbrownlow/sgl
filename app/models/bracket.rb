class Bracket < ActiveRecord::Base
	belongs_to :tournament
	has_many :matches
	has_many :players
	
end
