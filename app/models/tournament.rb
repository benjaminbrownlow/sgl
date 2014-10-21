class Tournament < ActiveRecord::Base
	has_many :brackets
	has_many :matches, through: :brackets
end
