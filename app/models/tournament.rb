class Tournament < ActiveRecord::Base
	has_many :activities
	has_many :players, through: :activities
	# has_many :brackets
	# has_many :matches, through: :brackets
end
