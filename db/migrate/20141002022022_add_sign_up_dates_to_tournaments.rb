class AddSignUpDatesToTournaments < ActiveRecord::Migration
  def change
  	add_column :tournaments, :description, :text
  	add_column :tournaments, :signUpDate, :datetime
  	add_column :tournaments, :gameDate, :datetime
  end
end
