class Tournament < ActiveRecord::Base
	has_many :activities
	has_many :brackets, :dependent => :destroy
	has_many :players, through: :activities
	
	# has_many :matches, through: :brackets
end
