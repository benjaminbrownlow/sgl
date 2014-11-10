class Player < ActiveRecord::Base
	has_many :activities
	has_many :tournaments, through: :activities
  belongs_to :bracket
  # belongs_to :match	

  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

