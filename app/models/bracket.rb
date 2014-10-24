class Bracket < ActiveRecord::Base
	belongs_to :tournament
	has_many :players
	has_many :matches
end
