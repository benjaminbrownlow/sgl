class Player < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :evetag, presence: true, uniqueness: true

	has_many :activities
	has_many :tournaments, through: :activities
  belongs_to :bracket
  # belongs_to :match	

  has_one :profile
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :avatar_file_name

  has_attached_file :avatar, :styles => { :medium => "165x165#", :thumb => "100x100#" }, :default_url => "/assets/medium/default.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def match
    Match.where('player_ids @> ARRAY[?]', id).all
  end
  
end

