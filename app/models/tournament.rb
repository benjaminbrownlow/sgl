class Tournament < ActiveRecord::Base
	has_many :activities
	has_many :brackets, :dependent => :destroy
	has_many :players, through: :activities
	
	# has_many :matches, through: :brackets
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
