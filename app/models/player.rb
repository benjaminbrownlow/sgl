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


  def self.set_activities
     @player = Player.all
     @player.each do |player|
      @activity = player.activities.build(:tournament_id => 2)
      @activity.save
     end
  end

end

