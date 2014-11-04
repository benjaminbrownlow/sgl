class Bracket < ActiveRecord::Base
	belongs_to :tournament
	has_many :matches, :dependent => :destroy
	has_many :players
	
end
